/*
  Warnings:

  - You are about to drop the column `compradorId` on the `Lance` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Lance" (
    "idLance" TEXT NOT NULL PRIMARY KEY,
    "valor" REAL NOT NULL,
    "leilaoId" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Lance_leilaoId_fkey" FOREIGN KEY ("leilaoId") REFERENCES "Leilao" ("idLeilao") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Lance" ("created_at", "idLance", "leilaoId", "updated_at", "valor") SELECT "created_at", "idLance", "leilaoId", "updated_at", "valor" FROM "Lance";
DROP TABLE "Lance";
ALTER TABLE "new_Lance" RENAME TO "Lance";
CREATE UNIQUE INDEX "Lance_leilaoId_key" ON "Lance"("leilaoId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
