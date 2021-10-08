
% close all
 prompt = 'What is track name? ';
 track = input(prompt);

ii=size(track);

fps=0.198; % frames per second


for ti=1:ii
     
  
     track{ti,1}(1,:)=[]; %removing first raws of all columns as they have zero as a value
        
     track{ti,1}(:,1)=(track{ti,1}(:,1)).*5.04; % converting frames to seconds, change the frame rate accordingly
     

    track{ti,1}(:,1)=((track{ti,1}(:,1))-min(track{ti,1}(:,1))); %standardizing time steps
     
     track{ti,1}(1,:)=[];%removing first raws of all columns
      track{ti,1}(end,:)=[];%removing last raws of all columns

    track{ti,1}(:,4)=[]; %removing the fourth column
     track{ti,1}(1:end-1,1)= track{ti,1}(2:end,1)- track{ti,1}(1:end-1,1);%standardizing time steps
% 
% 
    track1=track{ti,1}; %substituting track1 with time steps

trackx1= (track1(:,2).*0.1); % conerting pixels to microns, check the pixel to micron
trackx=trackx1(1:end-1);
trackx_next=trackx1(2:end);

tracky1= (track1(:,3).*0.1); % conerting pixels to microns, check the pixel to micron
tracky=tracky1(1:end-1);
tracky_next=tracky1(2:end);
% 
d_inst = sqrt((trackx_next-trackx).^2 + (tracky_next-tracky).^2); %implimenting the distance formula
t_inst = track{ti,1}(1:end-1,1);
t_inst1 = cumsum(track{ti,1}(1:end-3,1))/60; %gettinng continous time step

Speed_micron_per_min=(d_inst./t_inst)*60; %calculating speed per minute

Speed_micron_per_min=Speed_micron_per_min(Speed_micron_per_min>=1);
 C{ti} = Speed_micron_per_min; %saving speed values in a cell

      pd=fitdist(Speed_micron_per_min, 'Normal') %plotting a histogram ofthe speed per minute
   mu1=pd.mu; %finding the mean speed
   mu2(ti,1) = mu1; %saving the mean speed
   
   sigma1 = pd.sigma; %Finding the standard deviation
   sigma2(ti,1)=sigma1; %saving standard deviation
   

end
