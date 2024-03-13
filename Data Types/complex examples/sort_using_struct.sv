// Using an example of a sports event where 10 countries participated
// and rankings is based on the number of gold, silver, and bronze
// medals achieved by each country. total events are 50.

//NOTE: if run using mentor questa, change seed value in run options or in a run.do file
    // -sv_seed is an inbuilt cmd line option available in SV to change the seed value
    // The seed value used for this example is (-sv_seed 369569) used as a run option
        // For unknown reasons the default seed value does not work for mentor Questa on 
        // EDA Playground. The constraints provided get ignored and number of medals take arbitary values

typedef struct {
    string country;
    bit [5:0] gold, silver, bronze;
}medals_t;

class medal_assign;
    rand bit [5:0] gold [10];
    rand bit [5:0] silver [10]; 
    rand bit [5:0] bronze [10];
    
    constraint medal_c1{
        gold.sum() == 50;
        silver.sum() == 50;
        bronze.sum() == 50;
    }

    constraint medal_c2{
        foreach (gold[i]) {
            gold[i] inside {[0:50]};
            silver[i] inside {[0:50]};
            bronze[i] inside {[0:50]};
        }
    }
endclass

module top;
    medals_t medals_A[9:0];
    medal_assign medals = new();

    initial begin
        // randomly assign each country with different medal count
        assert(medals.randomize());
        //following can also be done in post_randomize function in class medal_assign
        foreach (medals_A[i]) begin
            medals_A[i].country = $sformatf("country_%0d", i );
            medals_A[i].gold = medals.gold[i];
            medals_A[i].silver = medals.silver[i];
            medals_A[i].bronze = medals.bronze[i];
        end

        $display("medals_A =\n\t %p", medals_A);
        foreach (medals_A[i]) begin
            $display("medals_A.gold[%0d] = %0d", i, medals_A[i].gold);  // additional check for medal count
        end

        // sort based on medals for rankings 
        medals_A.rsort() with (item.gold); //reverse sort with struct.gold as criteria
        $display("medals_A  after sorting (only gold medals as criteria) =\n\t %p", medals_A);

        medals_A.rsort() with (item.gold + item.silver + item.bronze); //reverse sort with number of total medals as criteria
        $display("medals_A  after sorting (total medals as criteria) =\n\t %p", medals_A);

        medals_A.rsort() with ({item.gold, item.silver, item.bronze}); //reverse sort with number of gold, silver and bronze medals as criteria (important)
        $display("medals_A  after sorting (total number of gold, silver and bronze) =\n\t %p", medals_A);
        
    end
endmodule