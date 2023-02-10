// SPDX-License-Identifier: MIT 
pragma solidity   0.8.8; //0.8.18 is Latest Version  ^ means ay version greater than 0.8.7
// pragma solidity >= 0.8.7 < 0.8.17 select between two versions

contract SimpleStorage{        //contract is akeyword just like class
        //boolean, uint, int, address, bytes  <- data types
        bool hasFavouriteNumber=true;  // boolean data type // by default private 
        uint  FavNumber;   //uint8 to uint256  256 is bit size allocated
        // uint public FavNumber;   //uint8 to uint256  256 is bit size allocated
        string FavNumberInText="FIVE";  //String data type   
        int256 favouriteInt=-10;   // both signed and unsigned integer
        address myAddress= 0xCC5441EfdBe9380d001dD57CdedF719343AB49e0;
        bytes32 favouriteBytes="cat";  // string to bytes like oXhdhsh
        // if we donot give value to variable it gets initialised to null value ie. zero
        function store(uint256 _FavNumber) public 
        {
            FavNumber= _FavNumber;
            FavNumber=FavNumber+10;
            // uint testvar=5;
        }

        // function something() public {
        //     // testvar=0; unaccessible out of scope
        // }

        // view- just to read data (no modification), pure-you cannot read data also   -- these do not consume gas unless called inside a function that consts gas
        //bcoz they donot change state of the blockchain
        function getFavNumber() public view returns(uint256){   // declaring public doesit automatically
            return FavNumber;
        }
        function add() public pure returns(uint256){   // declaring public doesit automatically
            return (1+1);
        }

        // visibility specifier public, private, external, internally
        // 0xd9145CCE52D386f254917e481eB44e9943F39138  our contract is deployed here

        //  ARRAY AND STRUCTURES IN SOLIDITY 
         struct People{
             uint256 fav;
             string name;
         }
        //  People public person=People({fav:2,name:"Anurag"});  //just like creating a public variable { means a structure}
        //  People public person1=People({fav:2,name:"ishu"});  
        //  People public person2=People({fav:2,name:"unknown"});
         
         People[] public people;  //dynamic array
         mapping(string => uint256) public nameToFavourite ;
        //  uint256[] public favs;
         function addPeople( uint _x,string memory _name) public {
            // people.push(People(_x,_name));  //best way
            // People memory newpeople0= People (_x,_name);
            People memory newpeople= People ({fav:_x, name:_name});
            people.push(newpeople);
            nameToFavourite[_name]=_x;   //by default every string is initialised to 0
         }
        // MEMory Keyword
        // 6 place to store data in solidity
        // Stack,memory,storage,calldata,code,logs

        // calldata temporary nonmodifiable, memory temporary modifiable
        // storage -- permanent modifiable  
        //  only array, structure and mapping have to be defined data location and string is array of char


        // MAPPING 
        // key-value pairs like 
        

} 


