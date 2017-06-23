modifyPlot=function(id, df, gois, expr, cand){

        options(stringsAsFactors=FALSE)

        system(paste("wget http://www.kegg.jp/kegg/pathway/map/",id,".png",sep=""))

        img=readPNG(paste(id,".png",sep=""))
        nmb_genes=0; ovl=0

        for(x in 1:dim(df)[1]){
                A=df[x,1];B=df[x,2];C=df[x,3];D=df[x,4];E=df[x,5]
                A=as.integer(A);B=as.integer(B);C=as.integer(C);D=as.integer(D)
                A=A;B=B+3;C=C+3;D=D+3
                if(dim(df)[1]>0 && E %in% gois[,2]){
                        if(E %in% cand){
                                for(p1 in (A-3):(C+3)){
                                        for(p2 in (B-3):(D+3)){
                                                img[p2,p1,1]=0
                                                img[p2,p1,2]=0
                                                img[p2,p1,3]=0
                                                img[p2,p1,4]=1
                                        }
                                }
                                ovl=ovl+1
                        }
                        c_g=subset(gois,gois[,2]==E)
                        c_g=c_g[1,1]
                        for(p in 1:dim(expr)[2]){
                                my_expr=expr[c_g,p]
                                nmb_genes=nmb_genes+1
                                A_=A+(p-1)*(C-A)/dim(expr)[2]
                                C_=A+(p)*(C-A)/dim(expr)[2]
                                if(!is.na(my_expr)){
                                        if(my_expr>=quantile(expr[,p],0) && my_expr<=quantile(expr[,p],0.25)){
                                                col1=255;col2=255;col3=1
                                        }
                                        if(my_expr>=quantile(expr[,p],0.25) && my_expr<=quantile(expr[,p],0.50)){
                                                col1=155;col2=1;col3=155
                                        }
                                        if(my_expr>=quantile(expr[,p],0.50) && my_expr<=quantile(expr[,p],0.75)){
                                                col1=1;col2=100;col3=200
                                        }
                                        if(my_expr>=quantile(expr[,p],0.75) && my_expr<=quantile(expr[,p],1)){
                                                col1=1;col2=255;col3=255
                                        }
                                        for(p1 in A_:C_){
                                                for(p2 in B:D){
                                                        img[p2,p1,1]=col1;img[p2,p1,2]=col2;img[p2,p1,3]=col3;img[p2,p1,4]=1
                                                }
                                        }
                                }
                        }
                }
        }
        cur_entry=(c(id,"genes in total:",nmb_genes,ovl))
        system(paste("rm",paste(id,".png",sep="")))
        writePNG(img,paste(id,"_modified",".png",sep=""))
        return(cur_entry)
}

