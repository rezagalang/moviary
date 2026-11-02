import { readFileSync } from 'node:fs';
import { after, before, beforeEach, test } from 'node:test';
import {
  assertFails,
  assertSucceeds,
  initializeTestEnvironment,
} from '@firebase/rules-unit-testing';
import { deleteDoc, doc, getDoc, setDoc } from 'firebase/firestore';

let env;

before(async () => {
  env = await initializeTestEnvironment({
    projectId: 'moviary-rules-test',
    firestore: { rules: readFileSync('../firestore.rules', 'utf8') },
  });
});

after(async () => {
  await env.cleanup();
});

beforeEach(async () => {
  await env.clearFirestore();
});

const item = (uid, id, extra = {}) => ({
  id,
  userId: uid,
  revision: 1,
  deviceId: 'device-1',
  ...extra,
});

const alice = () => env.authenticatedContext('alice').firestore();
const bob = () => env.authenticatedContext('bob').firestore();
const anonymous = () => env.unauthenticatedContext().firestore();

async function seed(path, data) {
  await env.withSecurityRulesDisabled(async (context) => {
    await setDoc(doc(context.firestore(), path), data);
  });
}

test('owner can create a valid library document', async () => {
  await assertSucceeds(
    setDoc(doc(alice(), 'users/alice/library/i1'), item('alice', 'i1')),
  );
});

test('owner can read their own document', async () => {
  await seed('users/alice/library/i1', item('alice', 'i1'));
  await assertSucceeds(getDoc(doc(alice(), 'users/alice/library/i1')));
});

test("another user cannot read or write someone else's data", async () => {
  await seed('users/alice/library/i1', item('alice', 'i1'));
  await assertFails(getDoc(doc(bob(), 'users/alice/library/i1')));
  await assertFails(
    setDoc(doc(bob(), 'users/alice/library/i2'), item('alice', 'i2')),
  );
});

test('unauthenticated users are denied', async () => {
  await seed('users/alice/library/i1', item('alice', 'i1'));
  await assertFails(getDoc(doc(anonymous(), 'users/alice/library/i1')));
  await assertFails(
    setDoc(doc(anonymous(), 'users/alice/library/i2'), item('alice', 'i2')),
  );
});

test('cannot create a document that claims another owner', async () => {
  await assertFails(
    setDoc(doc(alice(), 'users/alice/library/i1'), item('bob', 'i1')),
  );
});

test('payload id must match the document id', async () => {
  await assertFails(
    setDoc(doc(alice(), 'users/alice/library/i1'), item('alice', 'other')),
  );
});

test('revision must be an integer >= 1', async () => {
  await assertFails(
    setDoc(
      doc(alice(), 'users/alice/library/i1'),
      item('alice', 'i1', { revision: 0 }),
    ),
  );
  await assertFails(
    setDoc(
      doc(alice(), 'users/alice/library/i1'),
      item('alice', 'i1', { revision: 'one' }),
    ),
  );
});

test('unknown collections are rejected', async () => {
  await assertFails(
    setDoc(doc(alice(), 'users/alice/secrets/s1'), item('alice', 's1')),
  );
});

test('update must increase the revision', async () => {
  await seed('users/alice/library/i1', item('alice', 'i1', { revision: 2 }));
  const ref = doc(alice(), 'users/alice/library/i1');

  await assertFails(setDoc(ref, item('alice', 'i1', { revision: 2 })));
  await assertFails(setDoc(ref, item('alice', 'i1', { revision: 1 })));
  await assertSucceeds(setDoc(ref, item('alice', 'i1', { revision: 3 })));
});

test('update cannot change the owner', async () => {
  await seed('users/alice/library/i1', item('alice', 'i1'));
  await assertFails(
    setDoc(
      doc(alice(), 'users/alice/library/i1'),
      item('bob', 'i1', { revision: 2 }),
    ),
  );
});

test('owner can hard-delete (tombstone cleanup)', async () => {
  await seed('users/alice/library/i1', item('alice', 'i1'));
  await assertSucceeds(deleteDoc(doc(alice(), 'users/alice/library/i1')));
});

test('profile document is owner-only', async () => {
  await assertSucceeds(
    setDoc(doc(alice(), 'users/alice'), { displayName: 'Alice' }),
  );
  await assertFails(getDoc(doc(bob(), 'users/alice')));
  await assertFails(setDoc(doc(bob(), 'users/alice'), { displayName: 'x' }));
});
