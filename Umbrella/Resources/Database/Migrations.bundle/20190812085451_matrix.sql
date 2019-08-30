
-- ROOM

CREATE TABLE "room" (
"room_id"    TEXT,
"name"    TEXT,
"topic"    TEXT,
"canonical_alias"    TEXT,
PRIMARY KEY("room_id")
);

-- ROOM_MEMBER

CREATE TABLE "room_member" (
"id"    INTEGER PRIMARY KEY AUTOINCREMENT,
"user_id"    TEXT,
"room_id"    TEXT,
"membership"    TEXT,
"display_name"    TEXT,
FOREIGN KEY("room_id") REFERENCES "room"("room_id")
);

-- PUBLIC_ROOM

CREATE TABLE "public_room" (
"room_id"    TEXT,
PRIMARY KEY("room_id")
);

-- MESSAGE

CREATE TABLE "message" (
"event_id"    TEXT ,
"room_id"    TEXT,
"user_id"    TEXT,
"type"    TEXT,
"text"    TEXT,
"url"    TEXT,
"timestamp"    INTEGER,
PRIMARY KEY("event_id"),
FOREIGN KEY("room_id") REFERENCES "room"("room_id")
);

-- FORM_ANSWER
ALTER TABLE form_answer
ADD matrix_url_id TEXT;

-- CHECKLIST_CHECKED
ALTER TABLE checklist_checked
ADD matrix_url_id TEXT;
