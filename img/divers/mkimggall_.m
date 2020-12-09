%disp('already done')
%return

clear all
phtype = 1;  %1 = diver, 2 = deploy and 3 = on shore

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
imgdir = 'img/divers/'
[s,f2] = dirlist_([pwd '\'],'*tn.jpg')
[s,f] = dirlist_([pwd '\'],'*bg.jpg')
S = 1;
textstr{S} = ['    <div class="row d-flex justify-content-center align-items-center">  <!--  -------------------------------------------------------------------- -->'];S = S + 1;
for F = 1:size(f,1)
  [PP,NAME] = fileparts(f(F,:));
  textstr{S} = ['      <div class="col-md-' num2str(mdnum) ' mt-2  d-flex justify-content-center align-items-center">'];S = S + 1;
  
  titlestr = NAME;
  if phtype == 1
    if strcmp(deblank(f(F,:)),'g0048430_bg.jpg')
      titlestr = 'After deployment divers attached a white cable to the upper arm';
    end
    if strcmp(deblank(f(F,:)),'gopro_mf2_gopr0814_bg.jpg')
      titlestr = 'Diver boat at the site';
    end
    if strcmp(deblank(f(F,:)),'moby surface_bg.jpg')
      titlestr = 'Diver assisting to recover the buoy';
    end
    if strcmp(deblank(f(F,:)),'moby-l286_bot_before_02_bg.jpg')
      titlestr = 'A silver gershin tube on the bottom arm.  The buoy is deployed with out these attached.  The divers must attach them after deployment.  They also remove them before retrieval of the old buoy and during monthly cleanings.';
    end
    if strcmp(deblank(f(F,:)),'moby-l286_bot_diver_01_bg.jpg')
      titlestr = 'Diver getting ready to install tube on bottom arm';
    end
    if strcmp(deblank(f(F,:)),'moby-l286_bot_diver_02_bg.jpg')
      titlestr = 'Diver installing the gershin tube';
    end
    if strcmp(deblank(f(F,:)),'moby-l286_mid_diver_01_bg.jpg')
      titlestr = 'Diver cleaning the Ed and Lu sensors';
    end
    if strcmp(deblank(f(F,:)),'moby-l295_toped_berfore_04_bg.jpg')
      titlestr = 'Top arm before cleaning, you can see all the barnicles.  Sometimes they grow in the collectors';
    end
    if strcmp(deblank(f(F,:)),'moby-l295_toplu_after_01_bg.jpg')
      titlestr = 'Top arm gershin tube checking for barnicles.';
    end
    if strcmp(deblank(f(F,:)),'moby_l288_04_bg.jpg')
      titlestr = 'Divers connecting or unconnecting the buoy tether from the mooring line (~50 ft)';
    end
    if strcmp(deblank(f(F,:)),'moby_l288_09_bg.jpg')
      titlestr = 'Divers connecting or unconnecting the buoy tether from the mooring line (~50 ft)';
    end
    if strcmp(deblank(f(F,:)),'moby_l288_10_bg.jpg')
      titlestr = 'Divers connecting or unconnecting the buoy tether from the mooring line (~50 ft)';
    end
    if strcmp(deblank(f(F,:)),'moby_l288_20_bg.jpg')
      titlestr = 'Divers also have to install and remove the bridle at the bottom that holds the mushroom anchor and flooper stoppers.';
    end
    if strcmp(deblank(f(F,:)),'moby_l288_21_bg.jpg')
      titlestr = 'In this case it is being removed. A line from the diver boat is connected.  The divers then release it and to diver boat personel pull it in.';
    end
    if strcmp(deblank(f(F,:)),'moby_l288_24_bg.jpg')
      titlestr = 'Divers removing the bridel at the bottom of the buoy';
    end
    if strcmp(deblank(f(F,:)),'moby_l288_25_bg.jpg')
      titlestr = 'Divers removing the bridel at the bottom of the buoy';
    end
    if strcmp(deblank(f(F,:)),'moby_l288_26_bg.jpg')
      titlestr = 'Divers removing the bridel at the bottom of the buoy';
    end
    if strcmp(deblank(f(F,:)),'moby_l288_50_bg.jpg')
      titlestr = 'Another photo of divers working on the connection point of the buoy tether to the mooring line';
    end
    if strcmp(deblank(f(F,:)),'underwater_moby_bg.jpg')
      titlestr = 'Great under water photo with diver';
    end
  end
  if phtype == 2
    
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
  [PP,name2] = fileparts(deblank(f2(F,:)))
  name2 = strrep(name2,'_tn','');
  textstr{S} = ['          <p>'   name2 '</p>'];S = S + 1;
  
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
