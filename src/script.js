const { PrismaClient } = require("@prisma/client")

// 2
const prisma = new PrismaClient()

//3
async function main() {
  const newLink = await prisma.calls.create({
    data: {
      OI: 'Fullstack tutorial for GraphQL',
      CHNG_IN_OI: 'www.howtographql.com',
      VOLUME: '-',
      IV: '-',
      LTP: '-',
      CHNG: '-',
      BID_QTY: '-',
      BID_PRICE: '-',
      ASK_PRICE: '-',
      ASK_QTY: '-',
      STRIKE_PRICE: '-',
      SYMBOL: '-',
      DATE: '-'
    },
  })
  const allcalls = await prisma.calls.findMany()
  console.log(allcalls)
}

//4
main()
  .catch(e => {
    throw e
  })
  // 5
  .finally(async () => {
    await prisma.$disconnect()
  })
