%disp('already done')
%return


[s,f] = dirlist_([pwd '\'],'*.png')
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

