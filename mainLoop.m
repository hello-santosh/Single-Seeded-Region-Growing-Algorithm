function [BP,REGION] = mainLoop(THR,PG,image,REGION,SEEDi,SEEDj,BP,RCOUNT,R,C)

while ~isempty(PG)
    
    CP = str2double(split(PG(end),','));
    % Deleting the last element of the PG after loop
    PG(end) = [];
    
    % Checking the end cases where all the neighbours cannot be calculated
    if(CP(1) ~= 1 && CP(2) ~=1 && CP(1)~= R && CP(2)~=C)
        
        % Going through the pixel neigbour
        if(REGION(CP(1)-1,CP(2)) == 0)
            % Calculating the DIST based on Euclidean distance
            Dr = (image(CP(1)-1,CP(2),1) - image(SEEDi,SEEDj,1)).^2;
            Dg = (image(CP(1)-1,CP(2),2) - image(SEEDi,SEEDj,2)).^2;
            Db = (image(CP(1)-1,CP(2),3) - image(SEEDi,SEEDj,3)).^2;
            DIST = sqrt(Dr+Dg+Db);
            if(DIST<THR)
                % if distance is less than threshold then neighbour pixel is merged into the region
                REGION(CP(1)-1,CP(2)) = RCOUNT;
                PG(end+1) = string(CP(1)-1)+','+string(CP(2));
            else
                % else the neigbour pixel is added to boundary pixel
                BP(end+1) = string(CP(1)-1)+','+string(CP(2));
            end
        end

        % Going through the pixel neigbour
        if(REGION(CP(1)-1,CP(2)+1) == 0)
            % Calculating the DIST based on Euclidean distance
            Dr = (image(CP(1)-1,CP(2)+1,1) - image(SEEDi,SEEDj,1)).^2;
            Dg = (image(CP(1)-1,CP(2)+1,2) - image(SEEDi,SEEDj,2)).^2;
            Db = (image(CP(1)-1,CP(2)+1,3) - image(SEEDi,SEEDj,3)).^2;
            DIST = sqrt(Dr+Dg+Db);
            if(DIST<THR)
                % if distance is less than threshold then neighbour pixel is merged into the region
                REGION(CP(1)-1,CP(2)+1) = RCOUNT;
                PG(end+1) = string(CP(1)-1)+','+string(CP(2)+1);
            else
                % else the neigbour pixel is added to boundary pixel
                BP(end+1) = string(CP(1)-1)+','+string(CP(2)+1);
            end
        end

        % Going through the pixel neigbour
        if(REGION(CP(1),CP(2)+1) == 0)
            % Calculating the DIST based on Euclidean distance
            Dr = (image(CP(1),CP(2)+1,1) - image(SEEDi,SEEDj,1)).^2;
            Dg = (image(CP(1),CP(2)+1,2) - image(SEEDi,SEEDj,2)).^2;
            Db = (image(CP(1),CP(2)+1,3) - image(SEEDi,SEEDj,3)).^2;
            DIST = sqrt(Dr+Dg+Db);
            if(DIST<THR)
                % if distance is less than threshold then neighbour pixel is merged into the region
                REGION(CP(1),CP(2)+1) = RCOUNT;
                PG(end+1) = string(CP(1))+','+string(CP(2)+1);
            else
                % else the neigbour pixel is added to boundary pixel
                BP(end+1) = string(CP(1))+','+string(CP(2)+1);
            end
        end    

        % Going through the pixel neigbour
        if(REGION(CP(1)+1,CP(2)+1) == 0)
            % Calculating the DIST based on Euclidean distance
            Dr = (image(CP(1)+1,CP(2)+1,1) - image(SEEDi,SEEDj,1)).^2;
            Dg = (image(CP(1)+1,CP(2)+1,2) - image(SEEDi,SEEDj,2)).^2;
            Db = (image(CP(1)+1,CP(2)+1,3) - image(SEEDi,SEEDj,3)).^2;
            DIST = sqrt(Dr+Dg+Db);
            if(DIST<THR)
                % if distance is less than threshold then neighbour pixel is merged into the region
                REGION(CP(1)+1,CP(2)+1) = RCOUNT;
                PG(end+1) = string(CP(1)+1)+','+string(CP(2)+1);
            else
                % else the neigbour pixel is added to boundary pixel
                BP(end+1) = string(CP(1)+1)+','+string(CP(2)+1);
            end
        end     

        % Going through the pixel neigbour
        if(REGION(CP(1)+1,CP(2)) == 0)
            % Calculating the DIST based on Euclidean distance
            Dr = (image(CP(1)+1,CP(2),1) - image(SEEDi,SEEDj,1)).^2;
            Dg = (image(CP(1)+1,CP(2),2) - image(SEEDi,SEEDj,2)).^2;
            Db = (image(CP(1)+1,CP(2),3) - image(SEEDi,SEEDj,3)).^2;
            DIST = sqrt(Dr+Dg+Db);
            if(DIST<THR)
                % if distance is less than threshold then neighbour pixel is merged into the region
                REGION(CP(1)+1,CP(2)) = RCOUNT;
                PG(end+1) = string(CP(1)+1)+','+string(CP(2));
            else
                % else the neigbour pixel is added to boundary pixel
                BP(end+1) = string(CP(1)+1)+','+string(CP(2));
            end
        end 

        % Going through the pixel neigbour
        if(REGION(CP(1)+1,CP(2)-1) == 0)
            % Calculating the DIST based on Euclidean distance
            Dr = (image(CP(1)+1,CP(2)-1,1) - image(SEEDi,SEEDj,1)).^2;
            Dg = (image(CP(1)+1,CP(2)-1,2) - image(SEEDi,SEEDj,2)).^2;
            Db = (image(CP(1)+1,CP(2)-1,3) - image(SEEDi,SEEDj,3)).^2;
            DIST = sqrt(Dr+Dg+Db);
            if(DIST<THR)
                % if distance is less than threshold then neighbour pixel is merged into the region
                REGION(CP(1)+1,CP(2)-1) = RCOUNT;
                PG(end+1) = string(CP(1)+1)+','+string(CP(2)-1);
            else
                % else the neigbour pixel is added to boundary pixel
                BP(end+1) = string(CP(1)+1)+','+string(CP(2)-1);
            end
        end  

        % Going through the pixel neigbour
        if(REGION(CP(1),CP(2)-1) == 0)
            % Calculating the DIST based on Euclidean distance
            Dr = (image(CP(1),CP(2)-1,1) - image(SEEDi,SEEDj,1)).^2;
            Dg = (image(CP(1),CP(2)-1,2) - image(SEEDi,SEEDj,2)).^2;
            Db = (image(CP(1),CP(2)-1,3) - image(SEEDi,SEEDj,3)).^2;
            DIST = sqrt(Dr+Dg+Db);
            if(DIST<THR)
                % if distance is less than threshold then neighbour pixel is merged into the region
                REGION(CP(1),CP(2)-1) = RCOUNT;
                PG(end+1) = string(CP(1))+','+string(CP(2)-1);
            else
                % else the neigbour pixel is added to boundary pixel
                BP(end+1) = string(CP(1))+','+string(CP(2)-1);
            end
        end

        % Going through the pixel neigbour
        if(REGION(CP(1)-1,CP(2)-1) == 0)
            % Calculating the DIST based on Euclidean distance
            Dr = (image(CP(1)-1,CP(2)-1,1) - image(SEEDi,SEEDj,1)).^2;
            Dg = (image(CP(1)-1,CP(2)-1,2) - image(SEEDi,SEEDj,2)).^2;
            Db = (image(CP(1)-1,CP(2)-1,3) - image(SEEDi,SEEDj,3)).^2;
            DIST = sqrt(Dr+Dg+Db);
            if(DIST<THR)
                % if distance is less than threshold then neighbour pixel is merged into the region
                REGION(CP(1)-1,CP(2)-1) = RCOUNT;
                PG(end+1) = string(CP(1)-1)+','+string(CP(2)-1);
            else
                % else the neigbour pixel is added to boundary pixel
                BP(end+1) = string(CP(1)-1)+','+string(CP(2)-1);
            end
        end  
        
    end
    
end

end

