const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function teaAndBiscuits() {
  let first, second;

  reader.question("Would thou liketh someth tea?", (res) => {
    first = res;
    console.log(`You replieth ${res}.`);
  });

  reader.question("Would thou liketh someth bisckeths?", (res) => {
    second = res;
    console.log(`You replieth ${res}.`);
  });

  const firstRes = (first === 'ye') ? 'do' : 'donay';

  const secondRes = (second === 'ye') ? 'do' : 'donay';

  console.log(`So ye $(firstRes) waneth tea anth ye $(secondRes) waneth bisckeths`);
  reader.close();
}

// function teaAndBiscuits () {
//   reader.question('Would you like some tea?', function (res) {
//     console.log(`You replied ${res}.`);
//     reader.question('Would you like some biscuits?', function (res2) {
//       console.log(`You replied ${res2}.`);
//
//       const first = (res === 'yes') ? 'do' : 'don\'t';
//       const second = (res2 === 'yes') ? 'do' : 'don\'t';
//
//       console.log(`So you ${first} want tea and you ${second} want biscuits.`);
//       reader.close();
//     });
//   });
// }

teaAndBiscuits();
