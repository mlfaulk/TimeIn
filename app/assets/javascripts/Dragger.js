function Dragger(id) {
    //console.log("in dragger");
    this.isMouseDown = false;
    this.element = document.getElementById(id);
    var obj = this;
    this.element.onmousedown = function(event) {
        obj.mouseDown(event);
    }
}

Dragger.prototype.mouseDown = function(event) {
    console.log("in mousedown");

    event.preventDefault();
    var obj = this;
    //console.log("elem: " + this.element.id);
 
    this.oldMoveHandler = document.body.onmousemove;
    document.body.onmousemove = function(event) {
        obj.mouseMove(event);
    }
    this.oldUpHandler = document.body.onmouseup;
    document.body.onmouseup = function(event) {
        obj.mouseUp(event);
    }
    this.oldX = event.pageX;
    this.oldY = event.pageY;
    this.isMouseDown = true;
}

Dragger.prototype.mouseMove = function(event) {
    console.log("inmousemove");
    event.preventDefault();
    if (!this.isMouseDown) {
        return;
    }
    console.log("elem: " + this.element.id);
    //this.element.style.position = "";
    this.element.style.left = event.pageX + "px";
    this.element.style.top = event.pageY + "px";
    console.log(event.pageX+ ", " + event.pageY);
    console.log("left: " + this.element.style.left);
    console.log("top: " + this.element.style.top);

    //this.element.style.left = (this.element.offsetLeft
            //+ (event.pageX - this.oldX)) + "px";
    //this.element.style.top = (this.element.offsetTop
            //+ (event.pageY - this.oldY)) + "px";
    //this.oldX = event.pageX;
    //this.oldY = event.pageY;
}

Dragger.prototype.mouseUp = function(event) {
    event.preventDefault();
    this.isMouseDown = false;
    document.body.onmousemove = this.oldMoveHandler;
    document.body.onmouseup = this.oldUpHandler;
}