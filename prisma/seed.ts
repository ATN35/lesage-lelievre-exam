import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  await prisma.user.create({
    data: {
      email: 'admin@example.com',
      password: 'hashedpassword123',
    },
  });

  await prisma.product.create({
    data: {
      name: 'Cercueil en chêne',
      description: 'Un cercueil en bois massif.',
      price: 1500,
      stock: 10,
    },
  });

  console.log('✅ Seeding terminé avec succès !');
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
