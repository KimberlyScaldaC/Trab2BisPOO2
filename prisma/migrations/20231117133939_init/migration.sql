/*
  Warnings:

  - You are about to drop the column `dono` on the `Leilao` table. All the data in the column will be lost.
  - Added the required column `donoId` to the `Leilao` table without a default value. This is not possible if the table is not empty.

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
INSERT INTO "new_Leilao" ("created_at", "datalimite", "idLeilao", "preco", "produto", "updated_at") SELECT "created_at", "datalimite", "idLeilao", "preco", "produto", "updated_at" FROM "Leilao";
DROP TABLE "Leilao";
ALTER TABLE "new_Leilao" RENAME TO "Leilao";
CREATE UNIQUE INDEX "Leilao_donoId_key" ON "Leilao"("donoId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
