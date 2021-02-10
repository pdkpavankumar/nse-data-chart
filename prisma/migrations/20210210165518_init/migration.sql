/*
  Warnings:

  - Added the required column `SYMBOL` to the `Calls` table without a default value. This is not possible if the table is not empty.
  - Added the required column `DATE` to the `Calls` table without a default value. This is not possible if the table is not empty.
  - Added the required column `SYMBOL` to the `Puts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `DATE` to the `Puts` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Calls" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "OI" TEXT NOT NULL,
    "CHNG_IN_OI" TEXT NOT NULL,
    "VOLUME" TEXT NOT NULL,
    "IV" TEXT NOT NULL,
    "LTP" TEXT NOT NULL,
    "CHNG" TEXT NOT NULL,
    "BID_QTY" TEXT NOT NULL,
    "BID_PRICE" TEXT NOT NULL,
    "ASK_PRICE" TEXT NOT NULL,
    "ASK_QTY" TEXT NOT NULL,
    "STRIKE_PRICE" TEXT NOT NULL,
    "SYMBOL" TEXT NOT NULL,
    "DATE" TEXT NOT NULL
);
INSERT INTO "new_Calls" ("id", "createdAt", "OI", "CHNG_IN_OI", "VOLUME", "IV", "LTP", "CHNG", "BID_QTY", "BID_PRICE", "ASK_PRICE", "ASK_QTY", "STRIKE_PRICE") SELECT "id", "createdAt", "OI", "CHNG_IN_OI", "VOLUME", "IV", "LTP", "CHNG", "BID_QTY", "BID_PRICE", "ASK_PRICE", "ASK_QTY", "STRIKE_PRICE" FROM "Calls";
DROP TABLE "Calls";
ALTER TABLE "new_Calls" RENAME TO "Calls";
CREATE TABLE "new_Puts" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "BID_QTY" TEXT NOT NULL,
    "BID_PRICE" TEXT NOT NULL,
    "ASK_PRICE" TEXT NOT NULL,
    "ASK_QTY" TEXT NOT NULL,
    "CHNG" TEXT NOT NULL,
    "LTP" TEXT NOT NULL,
    "IV" TEXT NOT NULL,
    "VOLUME" TEXT NOT NULL,
    "CHNG_IN_OI" TEXT NOT NULL,
    "OI" TEXT NOT NULL,
    "STRIKE_PRICE" TEXT NOT NULL,
    "SYMBOL" TEXT NOT NULL,
    "DATE" TEXT NOT NULL
);
INSERT INTO "new_Puts" ("id", "createdAt", "BID_QTY", "BID_PRICE", "ASK_PRICE", "ASK_QTY", "CHNG", "LTP", "IV", "VOLUME", "CHNG_IN_OI", "OI", "STRIKE_PRICE") SELECT "id", "createdAt", "BID_QTY", "BID_PRICE", "ASK_PRICE", "ASK_QTY", "CHNG", "LTP", "IV", "VOLUME", "CHNG_IN_OI", "OI", "STRIKE_PRICE" FROM "Puts";
DROP TABLE "Puts";
ALTER TABLE "new_Puts" RENAME TO "Puts";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
