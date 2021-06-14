function[] = Plot_3fasce(param1,param2)
T = readtable(param1); %% inserire qua il csv da plottare.
Country = readtable('ContryProbe.csv');
load(param2) %% caricamento file di corrispondenza paesi probe
G = findgroups(T{:,1});     
Tc = splitapply( @(varargin) varargin, T, G);
FileOut= split(param1,"_")
FileOut2=split(FileOut{1},"/")


%% carica il file corrispondenza
[numRows,numCols] = size(Tc)

Nations={'ES','FR','IT','SE','DE'}
Nations2=["ES" "FR" "IT" "SE" "DE"]
Tc(:,5)=Corri(:,2) % forse cosi posso assegnare diretto le corrispondenze...

T=[]
tabellaTempi=cell(5,1)
tabellaPesi=cell(5,1)
parfor (g=1:size(Nations,2),3)
    singlerow=cell(1,2)
    tabellaTempo=[]
    tabellaPeso=[]
    for b=1:numRows
        
        if cell2mat(Tc(b,5)) == Nations{g}

            singlerow{1,1}=cell2mat(Tc(b,3))
            singlerow{1,2}=Tc{b,2}
            %appoggio=[]
            tabellaPeso=[tabellaPeso;singlerow{1}]
            tabellaTempo=[tabellaTempo;singlerow{2}]
        end

    end
    tabellaPesi{g,:}=tabellaPeso
    tabellaTempi{g,:}=tabellaTempo


end

%% non plotta tutto ma è follia farlo cosi tanto.
[Rows,Cols] = size(tabellaPesi)
for j = 1:Rows
    if(~cellfun('isempty',tabellaPesi(j,1)))
        tabx = table(tabellaPesi{j,1},tabellaTempi{j,1});
        tab1 = sortrows(tabx,2);
        %%tab2 = groupsummary(tab1,'Var2',hours(4),'median','Var1');
        tab2 = groupsummary(tab1,'Var2',hours(4),@(x) prctile(x,90));
        x=categorical(tab2.disc_Var2);
        %%y=double(tab2.90Perc_Var1);
        y= double(tab2.fun1_Var1);
        N = length(y);
        limit = 200;
        for i = 1:N
            if(y(i)>limit)
                y(i)=limit;
            end
        end

        stringa = string(x)
        stringa2 = split(stringa,',',2)
        iwant = stringa2(:,2)
        val = strrep(iwant,']','')
        val2 = strrep(val,')','')
        DateCorrectFormat = datetime(val2)
        tabletest=[]
        tabletest=table(DateCorrectFormat,y)
        sera= find((hour(DateCorrectFormat)<=4 | (20<hour(DateCorrectFormat) & hour(DateCorrectFormat)<=23)))
        pomeriggio=find( 12<hour(DateCorrectFormat) & hour(DateCorrectFormat)<=20)
        mattina=find(4<hour(DateCorrectFormat) & hour(DateCorrectFormat)<=12)
        tabmattina=tabletest(mattina,:)
        tabpomeriggio=tabletest(pomeriggio,:)
        tabsera=tabletest(sera,:)
        set(gcf, 'Visible', 'off');
        figure('Visible', 'off')
        scatter(tabmattina.DateCorrectFormat,tabmattina.y,'x');
        ylim([0 200])
        title('Plot 90Perc morning')
        xlabel('2h Time Bins') 
        ylabel('Result(ms)') 
        legend(Nations{j})
        set(gcf,'color','w');
        fname = sprintf('%s_%s_90Perc_morning_%s', FileOut2{end},FileOut{2},Nations{j});
        export_fig(['/home/guazzelli/disco/Thesis/Matlab file/plot/' fname], '-pdf');
        set(gcf, 'Visible', 'off');
        figure('Visible', 'off')
        scatter(tabpomeriggio.DateCorrectFormat,tabpomeriggio.y,'x');
        ylim([0 200])
        title('Plot 90Perc afternoon')
        xlabel('2h Time Bins') 
        ylabel('Result(ms)') 
        legend(Nations{j})
        set(gcf,'color','w');
        fname = sprintf('%s_%s_90Perc_afternoon_%s', FileOut2{end},FileOut{2},Nations{j});
        export_fig(['/home/guazzelli/disco/Thesis/Matlab file/plot/' fname], '-pdf');
        set(gcf, 'Visible', 'off');
        figure('Visible', 'off')
        scatter(tabsera.DateCorrectFormat,tabsera.y,'x');
        ylim([0 200])
        title('Plot 90Perc night')
        xlabel('2h Time Bins') 
        ylabel('Result(ms)') 
        legend(Nations{j})
        set(gcf,'color','w');
        fname = sprintf('%s_%s_90Perc_night_%s', FileOut2{end},FileOut{2},Nations{j});
        export_fig(['/home/guazzelli/disco/Thesis/Matlab file/plot/' fname], '-pdf');

    end
end

end