clear all;
global v_w=1.;
global gama=(pi/2*0.3); 

global CHx=.0;# hydrodynamic drag coefficient
global Cx=1; # aerodynamic drag coefficient
global Cz=12; # aerodynamic lift coefficient

## Assumed constant Cz/Cx ratio (which is not true, 
## additional parameter - angle of attack 
## for real boat shoud be incorporated)

function force = Fz(v)
	global v_w gama Cx Cz;
	force=0;
	force=Cz.*sqrt(v.^2+v_w.^2+2.*v.*v_w.*cos(gama)).*v_w.*sin(gama);
endfunction

# function force = Ftot(v)
# 	global v_w gama Cx Cz CHx;
# 	force=0;
# 	force=Cz.*sqrt(v.^2+v_w.^2+2.*v.*v_w.*cos(gama)).*v.*v_w.*sin(gama) \
#       - Cx.*sqrt(v.^2+v_w.^2+2.*v.*v_w.*cos(gama)).*(v.^2+v.*v_w.*cos(gama)) \
#   	  - CHx.*v.^2;
# endfunction


function force = Ftot(v)
	global v_w gama Cx Cz CHx;
	force=0;
	force=Cz.*sqrt(v.^2+v_w.^2+2.*v.*v_w.*cos(gama)).*v_w.*sin(gama) \
      - Cx.*sqrt(v.^2+v_w.^2+2.*v.*v_w.*cos(gama)).*(v+v_w.*cos(gama)) \
  	  - CHx.*v.^2;
endfunction

# Angle of Apparent Wind 
function y = AAW(v,gam)
	global  v_w;	
	y=gam-atan2( v.*sin(gam),v.*cos(gam)+v_w);
endfunction

# Solving Visualisation  procedure
function  [ vboat,gamas]=run(x)

global v_w gama CHx Cx Cz;
# argument can be suited
Cz=x;

Ngama=200;
i=1;
gamas=linspace(1e-4,pi-1e-4,Ngama);  
for gama=gamas 
  if (gama>atan(Cx/Cz))
		vboat(i)=fsolve(@Ftot,Cz);
	else
		vboat(i)=0;
	end
	i++; 
end;
#vboat=(vboat>0).*vboat;

# calculate speed against the wind - positive only!
upwind_vboat= cos(gamas).*vboat;
upwindidx=find( upwind_vboat>0 );
[v_upwind_max,v_upwind_imax]=max( upwind_vboat);
[v_max,v_imax]=max( vboat);



# calculate  angle: In Irons
y2=gamas(find (vboat>0)(1));

#figure(1)
subplot(1,2,1)
        plot(gamas./pi*180,vboat,\
	     gamas./pi*180,AAW(vboat,gamas),\
	     gamas./pi*180,vboat.*cos(gamas) )
subplot(1,2,2)

	polar(gamas(upwindidx),upwind_vboat(upwindidx))
hold on;
	polar(gamas(upwindidx),upwind_vboat(upwindidx))
	polar(-gamas(upwindidx),upwind_vboat(upwindidx))

	polar( gamas,vboat);
	polar( -gamas,vboat);

	plot([0,1],[0,tan(y2)])
	plot([0,1],[0,-tan(y2)])

	plot([0,1.2*v_upwind_max*cos(gamas(v_upwind_imax))],[0,1.2*v_upwind_max*sin(gamas(v_upwind_imax))])
	plot([0,1.2*v_max*cos(gamas(v_imax))       ],1.2*v_max*[0,1.2*v_max*sin(gamas(v_imax))])

hold off
endfunction

figure(1);
CHx=0;
[vboat,gamas]=run(5.4);
figure(2);
CHx=1;
[vboat,gamas]=run(10.4);

 # for CHx=linspace(0.0,4,5);
 # 	text(0,0,"DDD");
 #   [vboat,gamas]=run(4);
 # 	sleep(1);
 # 	drawnow();	
 # end;