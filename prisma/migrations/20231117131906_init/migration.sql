/*
  Warnings:

  - You are about to drop the column `donoId` on the `Leilao` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Leilao" (
    "idLeilao" TEXT NOT NULL PRIMARY KEY,
    "produto" TEXT NOT NULL,
    "preco" REAL NOT NULL,
    "datalimite" DATETIME NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Leilao" ("created_at", "datalimite", "idLeilao", "preco", "produto", "updated_at") SELECT "created_at", "datalimite", "idLeilao", "preco", "produto", "updated_at" FROM "Leilao";
DROP TABLE "Leilao";
ALTER TABLE "new_Leilao" RENAME TO "Leilao";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
