-- CreateEnum
CREATE TYPE "WorkspaceRole" AS ENUM ('OWNER', 'ADMIN', 'MEMBER');

-- AlterTable
ALTER TABLE "WorkspaceMemberships" ADD COLUMN     "role" "WorkspaceRole" NOT NULL DEFAULT 'MEMBER';
