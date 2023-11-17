/*
  Warnings:

  - You are about to drop the column `listaDeLances` on the `Leilao` table. All the data in the column will be lost.
  - Added the required column `compradorId` to the `Lance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `donoId` to the `Leilao` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Lance" (
    "idLance" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "valor" REAL NOT NULL,
    "compradorId" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Lance_compradorId_fkey" FOREIGN KEY ("compradorId") REFERENCES "Usuario" ("idUsuario") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Lance" ("idLance", "valor") SELECT "idLance", "valor" FROM "Lance";
DROP TABLE "Lance";
ALTER TABLE "new_Lance" RENAME TO "Lance";
CREATE UNIQUE INDEX "Lance_compradorId_key" ON "Lance"("compradorId");
CREATE TABLE "new_Leilao" (
    "idLeilao" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "produto" TEXT NOT NULL,
    "preco" REAL NOT NULL,
    "datalimite" DATETIME NOT NULL,
    "donoId" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Leilao_donoId_fkey" FOREIGN KEY ("donoId") REFERENCES "Usuario" ("idUsuario") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Leilao" ("datalimite", "idLeilao", "preco", "produto") SELECT "datalimite", "idLeilao", "preco", "produto" FROM "Leilao";
DROP TABLE "Leilao";
ALTER TABLE "new_Leilao" RENAME TO "Leilao";
CREATE UNIQUE INDEX "Leilao_donoId_key" ON "Leilao"("donoId");
CREATE TABLE "new_Usuario" (
    "idUsuario" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Usuario" ("email", "idUsuario", "nome") SELECT "email", "idUsuario", "nome" FROM "Usuario";
DROP TABLE "Usuario";
ALTER TABLE "new_Usuario" RENAME TO "Usuario";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
