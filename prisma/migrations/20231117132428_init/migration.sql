/*
  Warnings:

  - You are about to drop the column `leilaoId` on the `Lance` table. All the data in the column will be lost.
  - Added the required column `comprador` to the `Lance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `leilao` to the `Lance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dono` to the `Leilao` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Lance" (
    "idLance" TEXT NOT NULL PRIMARY KEY,
    "valor" REAL NOT NULL,
    "comprador" TEXT NOT NULL,
    "leilao" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Lance" ("created_at", "idLance", "updated_at", "valor") SELECT "created_at", "idLance", "updated_at", "valor" FROM "Lance";
DROP TABLE "Lance";
ALTER TABLE "new_Lance" RENAME TO "Lance";
CREATE TABLE "new_Leilao" (
    "idLeilao" TEXT NOT NULL PRIMARY KEY,
    "produto" TEXT NOT NULL,
    "preco" REAL NOT NULL,
    "datalimite" DATETIME NOT NULL,
    "dono" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Leilao" ("created_at", "datalimite", "idLeilao", "preco", "produto", "updated_at") SELECT "created_at", "datalimite", "idLeilao", "preco", "produto", "updated_at" FROM "Leilao";
DROP TABLE "Leilao";
ALTER TABLE "new_Leilao" RENAME TO "Leilao";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
