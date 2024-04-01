/*
  Warnings:

  - Added the required column `votesAmount` to the `PollOption` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "PollOption" ADD COLUMN     "votesAmount" INTEGER NOT NULL;
