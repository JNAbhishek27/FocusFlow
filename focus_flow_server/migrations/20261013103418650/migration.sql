BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "focus_sessions" (
    "id" bigserial PRIMARY KEY,
    "subjectId" bigint,
    "taskId" bigint,
    "durationMinutes" bigint NOT NULL,
    "completedAt" timestamp without time zone NOT NULL,
    "reflectionNotes" text,
    "productivityScore" bigint NOT NULL
);

-- Indexes
CREATE INDEX "focus_sessions_subject_idx" ON "focus_sessions" USING btree ("subjectId");
CREATE INDEX "focus_sessions_completed_at_idx" ON "focus_sessions" USING btree ("completedAt");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "study_subjects" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "colorHex" text NOT NULL,
    "iconName" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "study_subjects_name_idx" ON "study_subjects" USING btree ("name");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "study_tasks" (
    "id" bigserial PRIMARY KEY,
    "subjectId" bigint NOT NULL,
    "title" text NOT NULL,
    "notes" text,
    "priority" text NOT NULL,
    "estimatedMinutes" bigint NOT NULL,
    "isCompleted" boolean NOT NULL,
    "dueDate" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL,
    "completedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "study_tasks_subject_idx" ON "study_tasks" USING btree ("subjectId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "focus_sessions"
    ADD CONSTRAINT "focus_sessions_fk_0"
    FOREIGN KEY("subjectId")
    REFERENCES "study_subjects"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "focus_sessions"
    ADD CONSTRAINT "focus_sessions_fk_1"
    FOREIGN KEY("taskId")
    REFERENCES "study_tasks"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "study_tasks"
    ADD CONSTRAINT "study_tasks_fk_0"
    FOREIGN KEY("subjectId")
    REFERENCES "study_subjects"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR focus_flow
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('focus_flow', '20261013103418650', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261013103418650', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260824182259319', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182259319', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260924105404509', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105404509', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260924105232991', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105232991', "timestamp" = now();


COMMIT;
