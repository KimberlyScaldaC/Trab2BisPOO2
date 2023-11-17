/*
  Warnings:

  - Added the required column `leilaoId` to the `Lance` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Lance" (
    "idLance" TEXT NOT NULL PRIMARY KEY,
    "valor" REAL NOT NULL,
    "compradorId" TEXT NOT NULL,
    "leilaoId" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Lance_compradorId_fkey" FOREIGN KEY ("compradorId") REFERENCES "Usuario" ("idUsuario") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Lance_leilaoId_fkey" FOREIGN KEY ("leilaoId") REFERENCES "Leilao" ("idLeilao") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Lance" ("compradorId", "created_at", "idLance", "updated_at", "valor") SELECT "compradorId", "created_at", "idLance", "updated_at", "valor" FROM "Lance";
DROP TABLE "Lance";
ALTER TABLE "new_Lance" RENAME TO "Lance";
CREATE UNIQUE INDEX "Lance_compradorId_key" ON "Lance"("compradorId");
CREATE UNIQUE INDEX "Lance_leilaoId_key" ON "Lance"("leilaoId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
