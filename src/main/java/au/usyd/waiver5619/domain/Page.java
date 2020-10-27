package au.usyd.waiver5619.domain;

public class Page {
	
	//curret page
    private int current=1;

    //display limit
    private int limit=3;

    //data amount(calculate the whole page data)
    private int rows;

    //query path
    private String path;

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        if (current>=1){
            this.current = current;
        }
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        if (limit>=1&&limit<=100){
            this.limit = limit;
        }
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        if (rows>=0){
            this.rows = rows;
        }
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
    /**
     * start line
     **/
    public int getOffset(){
        //current*limit-limit
        return (current-1)*limit;
    }

    /**
     * total pages
     **/
    public int getTotal(){
        if (rows%limit==0){
            return rows/limit;
        }else {
            return rows/limit+1;
        }
    }

    public int getFrom(){
        int from=current-2;
        return from<1?1:from;
    }

    public int getTo(){
        int to=current+2;
        return to<getTotal()?to:getTotal();
    }
	
	

}
