package Chaincode

import (
	"fmt"
	"github.com/hyperledger/fabric/core/chaincode/shim"
	"github.com/hyperledger/fabric/protos/peer"
	"strconv"
)

type ManyArg struct {

}
type functions interface {
   	Init(stub shim.ChaincodeStubInterface) peer.Response
	Invoke(stub shim.ChaincodeStubInterface) peer.Response
	invoke(stub shim.ChaincodeStubInterface, args []string) peer.Response
	delete(stub shim.ChaincodeStubInterface, args []string) peer.Response
	query(stub shim.ChaincodeStubInterface, args []string) peer.Response
}

func (t *ManyArg) Init(stub shim.ChaincodeStubInterface) peer.Response  {
	fmt.Println("INIT STARTING")
	 _, args := stub.GetFunctionAndParameters()

	 var Value []int
	 var err error
	 var count int =0
	 var Atoi_res int =0

	 //init
	 for tmp :=0 ; tmp <= len(args)/2 ; tmp+=2 {
	 	Atoi_res, err = strconv.Atoi(args[tmp+1])
	 	if err != nil {
	 		return  shim.Error("!!!!!!!!Data is not integer!!!!!!!!")
		}else {
	 		count++
		}

	 	Value = append(Value, Atoi_res)
	 	err = stub.PutState(args[tmp],[]byte(strconv.Itoa(Value[count])))
	 	if err != nil {
	 		return shim.Error(err.Error())
		}
	 }
	 return shim.Success(nil)
}

func (t *ManyArg) Invoke(stub shim.ChaincodeStubInterface) peer.Response  {
	fmt.Println("INVOKE CHAINCODE")
	fn, args := stub.GetFunctionAndParameters()
	switch fn {
	case "invoke":
		return t.invoke(stub,args)
	case "delete":
		return t.delete(stub,args)
	case "query":
		return t.query(stub,args)
	default:
		return shim.Error("Invoke fail check fn name")
	}
}

func (t *ManyArg) invoke(stub shim.ChaincodeStubInterface, args []string)  peer.Response{
	var Val1, Val2 int = 0, 0
	var X int



}
func (t *ManyArg)delete(stub shim.ChaincodeStubInterface, args []string) peer.Response{

}
func (t *ManyArg)query(stub shim.ChaincodeStubInterface, args []string) peer.Response{

}

func (t *ManyArg)InvokeGetResult(stub shim.ChaincodeStubInterface, Entity string) (error,int,int){
	var err error
	ValueByte, err := stub.GetState(Entity)
	if err != nil {
		return err, 0, 0
	}
	if ValueByte == nil {
		return err, 1, 0
	}

	ValueInt,_ := strconv.Atoi(string(ValueByte))
	if err != nil {
		return err, 2, 0
	}
	return err,3,ValueInt
}