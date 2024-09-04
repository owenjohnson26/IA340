CREATE TABLE IF NOT EXISTS "Name" (
	"fips" varchar(4) NOT NULL,
	"names" varchar(100) NOT NULL UNIQUE,
	PRIMARY KEY ("fips")
);

CREATE TABLE IF NOT EXISTS "Income" (
	"fips" varchar(4) NOT NULL,
	"income" bigint NOT NULL,
	"year" bigint NOT NULL,
	PRIMARY KEY ("fips", "year")
);

CREATE TABLE IF NOT EXISTS "population" (
	"fips" varchar(4) NOT NULL,
	"pop" bigint NOT NULL,
	"year" bigint NOT NULL,
	PRIMARY KEY ("fips", "year")
);


ALTER TABLE "Income" ADD CONSTRAINT "Income_fk0" FOREIGN KEY ("fips") REFERENCES "Name"("fips");
ALTER TABLE "population" ADD CONSTRAINT "population_fk0" FOREIGN KEY ("fips") REFERENCES "Name"("fips");
