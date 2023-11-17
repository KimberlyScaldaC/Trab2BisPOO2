/*
  Warnings:

  - You are about to drop the column `comprador` on the `Lance` table. All the data in the column will be lost.
  - Added the required column `compradorId` to the `Lance` table without a default value. This is not possible if the table is not empty.

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
INSERT INTO "new_Lance" ("created_at", "idLance", "leilaoId", "updated_at", "valor") SELECT "created_at", "idLance", "leilaoId", "updated_at", "valor" FROM "Lance";
DROP TABLE "Lance";
ALTER TABLE "new_Lance" RENAME TO "Lance";
CREATE UNIQUE INDEX "Lance_compradorId_key" ON "Lance"("compradorId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
