disp('already done')
return

clear all
phtype = 2;  %1 = diver, 2 = deploy and 3 = on shore

[s,f] = dirlist_([pwd '\'],'*.jpg');
for F = 1:size(f,1)
  str = ['!rename ' deblank(f(F,:)) ' ' lower(deblank(f(F,:)))];
  s = 1;
  eval(str,'s=0')
  if s == 1
    disp(str)
  else
    disp(['NOT RENAMED ' str])
  end
end

numofrow = 6;
mdnum = 2;
imgdir = 'img/deploy/'
[s,f2] = dirlist_([pwd '\'],'*tn.jpg')
[s,f] = dirlist_([pwd '\'],'*bg.jpg')
S = 1;
textstr{S} = ['    <div class="row d-flex justify-content-center align-items-center">  <!--  -------------------------------------------------------------------- -->'];S = S + 1;
for F = 1:size(f,1)
  [PP,NAME] = fileparts(f(F,:));
  textstr{S} = ['      <div class="col-md-' num2str(mdnum) ' mt-2  d-flex justify-content-center align-items-center">'];S = S + 1;
  
  if phtype == 2
    
    titlestr = NAME;
    if strcmp(deblank(f(F,:)),'01_moby_pre_launch_bg.jpg')
       titlestr = 'Before deploying the buoy many cables and quick relwease lines must be attached and the ratchet staps holding the buoy to the ship must be removed.';          
    end
    if strcmp(deblank(f(F,:)),'moby_deploy1_1_bg.jpg')
      titlestr = 'Two ship board cranes are required to deploy MOBY, as well as, a small boat.  Which is used to move the buoy away from the ship once it is in the water.';
    end
    if strcmp(deblank(f(F,:)),'moby_deploy1_2_bg.jpg')
      titlestr = 'The crane simultaneously lifts both end of the buoy out of the cradles.  Tag lines are used to stabilize the buoy as it is lowered into the water.';     
    end
    if strcmp(deblank(f(F,:)),'moby_deploy1_3_bg.jpg')
      titlestr = 'As the buoy nears the water the small boat begins to pull on the top of the buoy. This helps keep the buoy from hitting the cradles as it is lowered into the water.';           
    end
    if strcmp(deblank(f(F,:)),'moby_deploy1_4_bg.jpg')
      titlestr = 'The small boat pulls more to continue to swing the top of the buoy away from the ship.';           
    end
    if strcmp(deblank(f(F,:)),'moby_deploy1_5_bg.jpg')
      titlestr = ' Once the top is in the water the quick release is pulled so the buoy is no longer attached to the crane and the small boat pulls the buoy away.';           
    end
    if strcmp(deblank(f(F,:)),'moby_deploy1_6_bg.jpg')
      titlestr = 'The second crane will be released once the top of the buoy is far enough out.';           
    end
    if strcmp(deblank(f(F,:)),'moby_deploy1_7_bg.jpg')
      titlestr = 'Both cranes are released and the small boat pulls the buoy away from the ship.';           
    end
    if strcmp(deblank(f(F,:)),'moby_deploy1_8_bg.jpg')
       titlestr = 'As it goes vertical the top is pulled back toward the ship. Long poles are used to keep the buoy away from the side of the ship.';          
    end
    if strcmp(deblank(f(F,:)),'moby_deploy1_9_bg.jpg')
       titlestr = 'The small boat will eventually get the buoy away from the ship and tow it to the mooring.';          
    end

    if strcmp(deblank(f(F,:)),'moby_retrv1_1_bg.jpg')
       titlestr = 'The diver connect the buoy to the 2 cranes abd the cranes start pulling the buoy bottom up slowly while the front crane keeps the buoys and arms from hitting the ship';          
    end
    if strcmp(deblank(f(F,:)),'moby_retrv1_2_bg.jpg')
       titlestr = 'The buoy continues to be pulled up slowly.';          
    end
    if strcmp(deblank(f(F,:)),'moby_retrv1_3_bg.jpg')
       titlestr = 'The buoy continues to be pulled up slowly.';          
    end
    if strcmp(deblank(f(F,:)),'moby_retrv1_4_bg.jpg')
      titlestr = 'The small boat which is still attached to the top and help keep the buoy from swinging and hitting the ship as it is lifted over the cradles';           
    end
    if strcmp(deblank(f(F,:)),'moby_retrv1_5_bg.jpg')
      titlestr = 'Once the cranes have the buoy level they start moving the buoy towards the cradles.';           
    end
    if strcmp(deblank(f(F,:)),'moby_retrv1_6_bg.jpg')
       titlestr = 'The buoy is safely in the cradles.  The crew will put the ratchet straps on to secure the buoy to the ship.';          
    end
    
    
  end
  
  textstr{S} = ['        <a href="' imgdir deblank(f(F,:)) '" data-toggle="lightbox" data-gallery="image-gallery" data-title="' titlestr '">'];S = S + 1;
  textstr{S} = ['          <img src="' imgdir deblank(f2(F,:)) '" class="img-fluid">'];S = S + 1;
  textstr{S} = ['          <p>'   deblank(f2(F,:)) '</p>'];S = S + 1;
  
  textstr{S} = ['        </a>'];S = S + 1;
  textstr{S} = ['      </div>'];S = S + 1;
  if rem(F,numofrow) == 0
    textstr{S} = ['    </div>   <!--  end row -->'];S = S + 1;
    textstr{S} = ['    <div class="row"><!--  -------------------------------------------------------------------- -->'];S = S + 1;
  end
end

HTMLfile = 'img_stuff.txt';
delete(HTMLfile)
fid = fopen(HTMLfile,'wt');
if fid > 0
  [M N] = size(textstr);
  for S = 1:N
    fwrite(fid,[char(textstr{S}) 10],'char');
  end
  fclose(fid);;
else
  disp([FCNname ' Error (Cound not open' HTMLfile ')'])
end
disp(['  Created ' HTMLfile])
