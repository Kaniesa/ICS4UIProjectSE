void PushclickHandler() { //Registers mouse clicks if PPL split is selected
  if (ppl) {
    if (mouseX>150 && mouseX<250 && mouseY>200 && mouseY<450  && ppl||mouseX>450 && mouseX<550 && mouseY>200 && mouseY<450 && ppl) {
      stroke(0);
      pause = false;
      PushdrawWindow();
    } else if (mouseX>250 && mouseX<350 && mouseY>200 && mouseY<450 && ppl ||mouseX>550 && mouseX<650 && mouseY>200 && mouseY<450 && ppl) {
      stroke(0);
      pause = false;
      ArmsdrawWindow();
    } else if (mouseX>350 && mouseX<450 && mouseY>200 && mouseY<450 && ppl ||mouseX>650 && mouseX<750 && mouseY>200 && mouseY<450 && ppl) {
      stroke(0);
      pause = false;
      LegsdrawWindow();
    }
  }
}

void ArnoldclickHandler() { //Registers mouse clicks if arnold split is selected
  if (arnold) {
    if (mouseX>150 && mouseX<250 && mouseY>200 && mouseY<450  && arnold||mouseX>450 && mouseX<550 && mouseY>200 && mouseY<450 && arnold) {
      stroke(0);
      pause = false;
      APushdrawWindow();
    } else if (mouseX>250 && mouseX<350 && mouseY>200 && mouseY<450  && arnold ||mouseX>550 && mouseX<650 && mouseY>200 && mouseY<450 && arnold) {
      stroke(0);
      pause = false;
      AArmsdrawWindow();
    } else if (mouseX>350 && mouseX<450 && mouseY>200 && mouseY<450 && arnold ||mouseX>650 && mouseX<750 && mouseY>200 && mouseY<450 && arnold) {
      stroke(0);
      pause = false;
      ALegsdrawWindow();
    }
  }
}
void ThreedayclickHandler() { //Registers mouse clicks if three day split is selected
  if (threeday) {
    if (mouseX>150 && mouseX<250 && mouseY>200 && mouseY<450 && threeday) {
      stroke(0);
      pause = false;
      PushdrawWindow();
    } else if (mouseX>350 && mouseX<450 && mouseY>200 && mouseY<450 && threeday ) {
      stroke(0);
      pause = false;
      ArmsdrawWindow();
    } else if (mouseX>550 && mouseX<650 && mouseY>200 && mouseY<450  && threeday) {
      stroke(0);
      pause = false;
      LegsdrawWindow();
    }
  }
}
void buttonClickHandler() { //Registers to draw lines and buttons for arnold and ppl splits
  if (ppl||arnold) {
    if (mouseX > 150 && mouseX < 250 && mouseY > 200 && mouseY < 450 || mouseX > 450 && mouseX < 550 && mouseY > 200 && mouseY < 450) {
      pause = false;
      showPushWindow = true;
    } else if (mouseX > 250 && mouseX < 350 && mouseY > 200 && mouseY < 450 || mouseX > 550 && mouseX < 650 && mouseY > 200 && mouseY < 450 ) {
      pause = false;
      showArmsWindow = true;
    } else if (mouseX > 350 && mouseX < 450 && mouseY > 200 && mouseY < 450 || mouseX > 650 && mouseX < 750 && mouseY > 200 && mouseY < 450) {
      pause = false;
      showLegsWindow = true;
    }
  } else if (threeday) {//Registers to draw lines and buttons for three day split
    if (mouseX>150 && mouseX<250 && mouseY>200 && mouseY<450) {
      pause = false;
      showPushWindow = true;
    } else if (mouseX>350 && mouseX<450 && mouseY>200 && mouseY<450) {
      pause = false;
      showArmsWindow = true;
    } else if (mouseX>550 && mouseX<650 && mouseY>200 && mouseY<450 ) {
      pause = false;
      showLegsWindow = true;
    }
  }
  // Check for exit button click
  if (showPushWindow || showArmsWindow || showLegsWindow) { //This is clicking the red X button to close the window for all th
    if (mouseX > 620 && mouseX < 650 && mouseY > 80 && mouseY < 100) {
      pause = true;
      showPushWindow = false;
      showArmsWindow = false;
      showLegsWindow = false;
    }
  }
}
