clc;close;clear
c=webcam;
load myNet;
faceDetector=vision.CascadeObjectDetector;
while true
    e=c.snapshot;   
    bboxes =step(faceDetector,e);
    if(sum(sum(bboxes))~=0)
     es=imcrop(e,bboxes(1,:));
    es=imresize(es,[227 227]);
    [class, score]=classify(myNet,es);
    image(e);
    title([ 'Person Name=' char(string(class)),', ','score=',num2str(max(score))])
    drawnow;
    else    
        image(e);
        title('No Face Detected');
    end
end