document.getElementById("question").focus();
document.getElementById("question").select();

var canvas = document.getElementById("myChart");
var ctx = canvas.getContext('2d');
var chartType = 'line';
var myLineChart;

// Global Options:
Chart.defaults.global.defaultFontColor = 'black';
Chart.defaults.global.defaultFontSize = 16;

let data = {
    borderColor : "#fffff",
    labels: null,
    datasets: [{
        label: 'Random integer',
        data: null,
        backgroundColor: "rgb(0,0,255)",
        borderColor: "rgb(0,0,255)",
    }]
  };

let  options = {
    responsive: true,
    fill: false,
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
                fontSize : 14,            
                display: true
            }
        }],
        yAxes: [{
            stepSize : 1,
            fontColor : "#fff",
            display: true,
            min: 0,
            max: 19
        }],
    },   
    title: {
        fontSize: 18,
        display: true,
        text: 'Random Number Generated for Answer',
        position: 'top'
      }  
};

// Intialize the chart function--------------------
function init() {
  // Chart declaration:
  myLineChart = new Chart(ctx, {
    type: chartType,
    data: data,
    options: options
  });
}

// The add data function--------------------------
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
    console.log('ask1');
    // Hide the question form and the Ask button 
    const formobj  = document.getElementById('theform');
    if (formobj[0].value) {
        formobj.classList.add('hidden');  //Addes the hidden class to the form so it vanishes

        // Get the randon answer
        let {answer,rnum} = randanswer ();
    
        // Unhide the question div and get the question from the form
        // create a paragraph and put the question in the paragraph the
        // Make it glow.
        const questdiv  = document.getElementById('questdiv');
        questdiv.classList.remove('hidden');
        const p = document.createElement('p');
        questdiv.appendChild(p);
        p.innerHTML = formobj[0].value;
        p.classList.add('glow');
    
        // Find the div to put the random answer in (centered) and put the
        // anser in it and add the glow2 (yellow glow) and change the style to be
        // 50 px
        const ansdiv  = document.getElementById('ansdiv');
        const m8txt   = document.getElementById('centered');
        m8txt.innerHTML = answer;
        ////console.log(answer)
        // m8txt.classList.add('pformat2');
        m8txt.classList.add('glow2');
        m8txt.style.fontSize = '50px';
    
        // Make the reset buton visible
        const formobj2  = document.getElementById('theform2');
        formobj2.classList.remove('hidden');
    
        // Get the data from the session storage, add it to the myLineChart data and update
        //graph.  If there is no data in storage the initialize the graph
        let Glabel = sessionStorage.getItem('chartlabels');
        let Gdata  = sessionStorage.getItem('chartdata');
        if (Gdata) {
            init();
            myLineChart.data.labels = JSON.parse(Glabel);
            myLineChart.data.datasets[0].data = JSON.parse(Gdata);
        } else {
            init();
            sessionStorage.setItem('chartlabels',JSON.stringify(myLineChart.data.labels));
            sessionStorage.setItem('chartdata',JSON.stringify(myLineChart.data.datasets[0].data));    
        }
    
        lstr = myLineChart.data.labels;
    
        addData(myLineChart, lstr.length+1, rnum);
        //console.log(myLineChart);
    
        sessionStorage.setItem('chartlabels',JSON.stringify(myLineChart.data.labels));
        sessionStorage.setItem('chartdata',JSON.stringify(myLineChart.data.datasets[0].data));
    } else {
        alert('You need to enter a question');
    }
    
}  

// RESET BUTTON ---------------------------------------------------------------
function reset(event) {
    event.preventDefault();
    console.log('reset1');
    const formobj  = document.getElementById('theform');
    formobj.classList.remove('hidden'); 
    const formobj2  = document.getElementById('theform2');
    formobj2.classList.add('hidden');
    const questdiv  = document.getElementById('questdiv');
    questdiv.classList.add('hidden');

    console.log('reset2');

    // Get the data from the session storage, add it to the myLineChart data and update
    //graph.  If there is no data in storage the initialize the graph
    // let Glabel = sessionStorage.getItem('chartlabels');
    // let Gdata  = sessionStorage.getItem('chartdata');
    // console.log('Reset');
    // if (Gdata) {
    //     init();
    //     myLineChart.data.labels = JSON.parse(Glabel);
    //     myLineChart.data.datasets[0].data = JSON.parse(Gdata);
    // } else {
    //     init();
    //     sessionStorage.setItem('chartlabels',JSON.stringify(myLineChart.data.labels));
    //     sessionStorage.setItem('chartdata',JSON.stringify(myLineChart.data.datasets[0].data));    
    // }
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


