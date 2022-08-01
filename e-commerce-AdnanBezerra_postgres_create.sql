CREATE TABLE "public.Users" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL UNIQUE,
	CONSTRAINT "Users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Products" (
	"id" serial NOT NULL UNIQUE,
	"name" TEXT NOT NULL,
	"price" integer NOT NULL,
	"category" TEXT NOT NULL,
	"size" char(1) NOT NULL,
	"mainImage" serial NOT NULL UNIQUE,
	CONSTRAINT "Products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Images" (
	"id" serial NOT NULL,
	"link" TEXT NOT NULL UNIQUE,
	"productId" serial UNIQUE,
	CONSTRAINT "Images_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Sales" (
	"id" serial NOT NULL,
	"user" serial NOT NULL,
	"status" TEXT NOT NULL,
	"date" TIMESTAMP NOT NULL,
	"address" TEXT NOT NULL,
	CONSTRAINT "Sales_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Orders" (
	"id" serial NOT NULL,
	"itemId" serial NOT NULL,
	"itemAmount" serial NOT NULL,
	"sale" serial NOT NULL,
	CONSTRAINT "Orders_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Products" ADD CONSTRAINT "Products_fk0" FOREIGN KEY ("mainImage") REFERENCES "Images"("id");

ALTER TABLE "Images" ADD CONSTRAINT "Images_fk0" FOREIGN KEY ("productId") REFERENCES "Products"("id");

ALTER TABLE "Sales" ADD CONSTRAINT "Sales_fk0" FOREIGN KEY ("user") REFERENCES "Users"("id");

ALTER TABLE "Orders" ADD CONSTRAINT "Orders_fk0" FOREIGN KEY ("itemId") REFERENCES "Products"("id");
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_fk1" FOREIGN KEY ("sale") REFERENCES "Sales"("id");






