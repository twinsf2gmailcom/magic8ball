document.getElementById("question").focus();
document.getElementById("question").select();


function ask(event) {
    event.preventDefault();
    const formobj  = document.getElementById('theform');
    // console.log(formobj)
    
    formobj.classList.add('hidden');  //Addes the hidden class to the form so it vanishes
    answer = randanswer ();

    // for (let i = 0; i < 100; i++) {
    //     answer = randanswer ();
    // };  

    const questdiv  = document.getElementById('questdiv');
    questdiv.classList.remove('hidden');
    const p = document.createElement('p');
    questdiv.appendChild(p);
    p.innerHTML = formobj[0].value;
    p.classList.add('pformat');

    const ansdiv  = document.getElementById('ansdiv');
    const p1 = document.createElement('p');
    ansdiv.appendChild(p1);
    p1.innerHTML = answer;
    p1.classList.add('pformat2');

    const formobj2  = document.getElementById('theform2');
    formobj2.classList.remove('hidden');
}  

function reset(event) {
    event.preventDefault();
    const formobj  = document.getElementById('theform');
    formobj.classList.remove('hidden'); 
    const formobj2  = document.getElementById('theform2');
    formobj2.classList.add('hidden');
    const questdiv  = document.getElementById('questdiv');
    questdiv.classList.add('hidden');
}

function randanswer () {
    let rnum = Math.floor(Math.random() * 20);
    console.log(rnum);
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

    return answer;
}