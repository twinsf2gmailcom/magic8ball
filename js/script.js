document.getElementById("question").focus();
document.getElementById("question").select();

// GRPAHING THE DATA -------------------------------------------------------------------------------------------
window.chartColors = {
    red: 'rgb(255, 99, 132)',
    orange: 'rgb(255, 159, 64)',
    yellow: 'rgb(255, 205, 86)',
    green: 'rgb(75, 192, 192)',
    blue: 'rgb(54, 162, 235)',
    purple: 'rgb(153, 102, 255)',
    grey: 'rgb(231,233,237)'
  };
  
var ctx = document.getElementById('myChart');
// console.log(ctx)
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    borderColor : "#fffff",
    labels: null,
    datasets: [{
        label: 'Random integer',
        data: null,
    }]
  },
  options: {
    // responsive: true,
    // borderColor: window.chartColors.yellow,
    // borderWidth: 15,
    // defaultFontSize: 30,
    // defaultFontColor: "#fff",
    // borderColor: "rgb(255, 255, 255)",
    // defaultColor: "rgba(255,255,255,1)",
    // fill: false,
    title: {
        display: true,
        text: 'Random Number Generated for Answer'
      },
      tooltips: {
        mode: 'index',
        intersect: true
      },   
      scales: {
        xAxes: [{
          display: true,
          ticks: {
            min: 0,
            stepSize : 1,
            fontColor : "#fff",
            fontSize : 14            
          }
        }],
        yAxes: [{
          display: true
        }],
      }       
  }
});

function addData(chart, label, data) {
    chart.data.labels.push(label);
    chart.data.datasets.forEach((dataset) => {
        dataset.data.push(data);
    });
    chart.update();
}

// ------------------------------------------------------------------------------------------------------------
// ASK  BUTTON SECTION
// ------------------------------------------------------------------------------------------------------------
function ask(event) {
    event.preventDefault();
    const formobj  = document.getElementById('theform');
    // console.log(formobj)
    
    formobj.classList.add('hidden');  //Addes the hidden class to the form so it vanishes
    let {answer,rnum} = randanswer ();

    const questdiv  = document.getElementById('questdiv');
    questdiv.classList.remove('hidden');
    const p = document.createElement('p');
    questdiv.appendChild(p);
    p.innerHTML = formobj[0].value;
    p.classList.add('glow');

    const ansdiv  = document.getElementById('ansdiv');
    const m8txt   = document.getElementById('centered');
    m8txt.innerHTML = answer;
    console.log(answer)
    // m8txt.classList.add('pformat2');
    m8txt.classList.add('glow2');
    m8txt.style.fontSize = '50px';

    const formobj2  = document.getElementById('theform2');
    formobj2.classList.remove('hidden');

    let Glabel = sessionStorage.getItem('chartlabels');
    let Gdata  = sessionStorage.getItem('chartdata');
    if (Gdata) {
        myLineChart.data.labels = JSON.parse(Glabel);
        myLineChart.data.datasets[0].data = JSON.parse(Gdata);
    }

    lstr = myLineChart.data.labels;

    addData(myLineChart, lstr.length+1, rnum);
    console.log(myLineChart);

    sessionStorage.setItem('chartlabels',JSON.stringify(myLineChart.data.labels));
    sessionStorage.setItem('chartdata',JSON.stringify(myLineChart.data.datasets[0].data));
}  

// RESET BUTTON ---------------------------------------------------------------
function reset(event) {
    event.preventDefault();
    const formobj  = document.getElementById('theform');
    formobj.classList.remove('hidden'); 
    const formobj2  = document.getElementById('theform2');
    formobj2.classList.add('hidden');
    const questdiv  = document.getElementById('questdiv');
    questdiv.classList.add('hidden');
}

//  Function that returns randon number and answer to ask ()
function randanswer () {
    let rnum = Math.floor(Math.random() * 20);
    // console.log(rnum);
    let answer = 0; 
    switch(rnum) {
        case 0:
            answer = "As I see it, yes.";
            break;
        case 1:
            answer = "Ask again later.";
            break;
        case 2:
            answer = "Better not tell you now.";
            break;
        case 3:
            answer = "Cannot predict now.";
            break;
        case 4:
            answer = "Concentrate and ask again.";
            break;
        case 5:
            answer = "Don’t count on it.";
            break;
        case 6:
            answer = "It is certain.";
            break;
        case 7:
            answer = "It is decidedly so.";
            break;
        case 8:
            answer = "Most likely.";
            break;
        case 9:
            answer = "My reply is no.";
            break;
        case 10:    
            answer = "My sources say no.";
            break;
        case 11:    
            answer = "Outlook not so good.";
            break;
        case 12:    
            answer = "Outlook good.";
            break;
        case 13:    
            answer = "Reply hazy, try again.";
            break;
        case 14:    
            answer = "Signs point to yes.";
            break;
        case 15:
            answer = "Very doubtful.";
            break;
        case 16:
            answer = "Without a doubt.";
            break;
        case 17:    
            answer = "Yes.";
            break;
        case 18:
            answer = "Yes – definitely.";
            break;
        case 19:
            answer = "You may rely on it.";
            break;
        default:
            answer = "Sorry you are on your own";
            break
    }
 
    return {answer, rnum};
}


