/*
  Warnings:

  - The primary key for the `Leilao` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Lance` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Leilao" (
    "idLeilao" TEXT NOT NULL PRIMARY KEY,
    "produto" TEXT NOT NULL,
    "preco" REAL NOT NULL,
    "datalimite" DATETIME NOT NULL,
    "donoId" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Leilao_donoId_fkey" FOREIGN KEY ("donoId") REFERENCES "Usuario" ("idUsuario") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Leilao" ("created_at", "datalimite", "donoId", "idLeilao", "preco", "produto", "updated_at") SELECT "created_at", "datalimite", "donoId", "idLeilao", "preco", "produto", "updated_at" FROM "Leilao";
DROP TABLE "Leilao";
ALTER TABLE "new_Leilao" RENAME TO "Leilao";
CREATE UNIQUE INDEX "Leilao_donoId_key" ON "Leilao"("donoId");
CREATE TABLE "new_Lance" (
    "idLance" TEXT NOT NULL PRIMARY KEY,
    "valor" REAL NOT NULL,
    "compradorId" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Lance_compradorId_fkey" FOREIGN KEY ("compradorId") REFERENCES "Usuario" ("idUsuario") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Lance" ("compradorId", "created_at", "idLance", "updated_at", "valor") SELECT "compradorId", "created_at", "idLance", "updated_at", "valor" FROM "Lance";
DROP TABLE "Lance";
ALTER TABLE "new_Lance" RENAME TO "Lance";
CREATE UNIQUE INDEX "Lance_compradorId_key" ON "Lance"("compradorId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
