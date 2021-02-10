const { PrismaClient } = require("@prisma/client")

const fs = require('fs');
const csv = require('csvtojson');
const { exit } = require("process");

// 2
const prisma = new PrismaClient()

//3
async function main() {
  const path = './download';
  fs.readdirSync(path).forEach(async (file) => {
    var data = await csv({
      noheader: true
    }).fromFile(path + '/' + file);

    data.splice(0, 2);
    var i = 1;
    const promises = data.map(async item => {
      item = Object.values(item);
      item.splice(0, 1);
      item.pop();
      console.log(`adding file ${file} line no. ${i} of ${data.length}`);
      i++;
      await prisma.calls.create({
        data: {
          OI: item[0],
          CHNG_IN_OI: item[1],
          VOLUME: item[2],
          IV: item[3],
          LTP: item[4],
          CHNG: item[5],
          BID_QTY: item[6],
          BID_PRICE: item[7],
          ASK_PRICE: item[8],
          ASK_QTY: item[9],
          STRIKE_PRICE: item[10],
          SYMBOL: file.split('-')[0],
          DATE: file.split('-')[1].split('_').join('-').replace('.csv', '')
        }
      });

      await prisma.puts.create({
        data: {
          BID_QTY: item[11],
          BID_PRICE: item[12],
          ASK_PRICE: item[13],
          ASK_QTY: item[14],
          CHNG: item[15],
          LTP: item[16],
          IV: item[17],
          VOLUME: item[18],
          CHNG_IN_OI: item[19],
          OI: item[20],
          STRIKE_PRICE: item[10],
          SYMBOL: file.split('-')[0],
          DATE: file.split('-')[1].split('_').join('-').replace('.csv', '')
        }
      });
    });
    await Promise.all(promises);
    exit(0);
  });
  // const allcalls = await prisma.calls.findMany()
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
