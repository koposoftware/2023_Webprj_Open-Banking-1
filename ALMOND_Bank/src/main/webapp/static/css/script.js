const root = document.documentElement;
const changeBtn = document.getElementById('hi-changeBtn');
let mode = false;

let whiteColor = getComputedStyle(root).getPropertyValue("--white");
let blackColor = getComputedStyle(root).getPropertyValue("--black");

changeBtn.addEventListener('click', (e) => changeColor());

function changeColor() {
    mode = !mode;
    if(mode) {
        root.style.setProperty('--white', blackColor);
        root.style.setProperty('--black', whiteColor);
    } else {
        root.style.setProperty('--white', whiteColor);
        root.style.setProperty('--black', blackColor);
    }
}

const slideTL = gsap.timeline();
const maskTL = gsap.timeline();
const mainTL = gsap.timeline({ 
    repeat: -1, 
    onRepeat: () => {
        gsap.set('#hi-texttwo', { opacity: 0 });
        gsap.set('#hi-bar', { scaleY: 0.1 });
        gsap.set('#hi-textone h1', { opacity: 1 });
    }
});

gsap.set('#hi-texttwo', { opacity: 0 });
gsap.set('#hi-bar', { scaleY: 0.1 });

slideTL
    .to('#hi-bar', 1, { 
        y: 225, 
        scaleY: 1, 
        ease: "back.out" 
    })
    .to('#hi-slidebar', 1.5, { 
        x: 600, 
        delay: 0.5, 
        ease: "back.inOut(0.8)" 
    })
    .to('#hi-slidebar', 1.5, { 
        x: 0, 
        delay: 0.5, 
        ease: "back.inOut(0.8)" 
    })
    .to('#hi-slidebar', 1.5, { 
        x: 600, 
        delay: 0.5, 
        ease: "back.inOut(0.8)" 
    })
    .to('#hi-bar', 1, { 
        y: 500, 
        scaleY: 0.1, 
        ease: "back.in" 
    });

maskTL
    .to('#hi-textone', 1.5, {
        ease: "back.inOut(0.8)", 
        "clip-path": "polygon(0 0, 91% 0, 81% 100%, 0% 100%)",
        onComplete: () => {
            gsap.set('#hi-texttwo', { opacity: 1 });
        }
    })
    .to('#hi-textone', 1.5, {
        delay: 0.5,
        ease: "back.inOut(0.8)", 
        "clip-path": "polygon(0 0, 18% 0, 8% 100%, 0% 100%)",
        onComplete: () => {
            gsap.set('#hi-textone h1', { opacity: 0 });
        }
    })
    .to('#hi-textone', 1.5, {
        delay: 0.5,
        ease: "back.inOut(0.8)", 
        "clip-path": "polygon(0 0, 91% 0, 81% 100%, 0% 100%)"
    }); 


mainTL
    .add(slideTL)
    .add(maskTL, 1.5);