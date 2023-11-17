-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Lance" (
    "idLance" TEXT NOT NULL PRIMARY KEY,
    "valor" REAL NOT NULL,
    "leilaoId" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Lance" ("created_at", "idLance", "leilaoId", "updated_at", "valor") SELECT "created_at", "idLance", "leilaoId", "updated_at", "valor" FROM "Lance";
DROP TABLE "Lance";
ALTER TABLE "new_Lance" RENAME TO "Lance";
CREATE UNIQUE INDEX "Lance_leilaoId_key" ON "Lance"("leilaoId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
