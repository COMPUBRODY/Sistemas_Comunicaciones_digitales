function    resptemp    =   convrec(filtroht,filtrohtcon);
    %esta uncion convoluciona dos secuencias y recota el resulado al tamaño de lS MISMAS en vez que 
    %centra el resultado en cero, las secuencias deben de ser del mismo tamaño

    lonfrec =   length(filtroht);
    resptemp    =   conv(filtroht,filtrohtcon);
    resptemp    =   resptemp(   ((lonfrec-1)/2)+1    :   ((lonfrec-1)/2)+lonfrec       );

    