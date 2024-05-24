-- CreateTable
CREATE TABLE "Petitoner" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "rank" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "service" TEXT NOT NULL,

    CONSTRAINT "Petitoner_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Case" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "year" TEXT NOT NULL,
    "subject" TEXT NOT NULL,
    "brief" TEXT NOT NULL,
    "petitonerId" INTEGER NOT NULL,
    "petitionerLawyer" TEXT NOT NULL,
    "respondentLawyers" TEXT[],
    "respondants" TEXT[],
    "finalPrayers" TEXT[],
    "interimPrayers" JSONB,
    "interimPrayerDate" TIMESTAMP(3),
    "noticeDate" TIMESTAMP(3) NOT NULL,
    "counterDate" TIMESTAMP(3),
    "rejoinderDate" TIMESTAMP(3),
    "lastListedDate" TIMESTAMP(3),
    "nextListingDate" TIMESTAMP(3),
    "finalOrderDate" TIMESTAMP(3),
    "favour" BOOLEAN NOT NULL,
    "LTAFilled" BOOLEAN,
    "dateOfLTA" TIMESTAMP(3),
    "dateOfCompliance" TIMESTAMP(3),
    "dateOfLegalOpinion" TIMESTAMP(3),
    "executionFilled" BOOLEAN,
    "executionStatus" TEXT,
    "courtId" INTEGER,

    CONSTRAINT "Case_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Court" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT,

    CONSTRAINT "Court_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Case" ADD CONSTRAINT "Case_petitonerId_fkey" FOREIGN KEY ("petitonerId") REFERENCES "Petitoner"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case" ADD CONSTRAINT "Case_courtId_fkey" FOREIGN KEY ("courtId") REFERENCES "Court"("id") ON DELETE SET NULL ON UPDATE CASCADE;
