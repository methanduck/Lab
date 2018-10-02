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

func (t *ManyArg) Init(stub shim.ChaincodeStubInterface) peer.Response {
	fmt.Println("INIT STARTING")
	_, args := stub.GetFunctionAndParameters()

	var Value []int
	var err error
	var count int = 0
	var Atoi_res int = 0

	//init
	for tmp := 0; tmp <= len(args)/2; tmp += 2 {
		Atoi_res, err = strconv.Atoi(args[tmp+1])
		if err != nil {
			return shim.Error("!!!!!!!!Data is not integer!!!!!!!!")
		} else {
			count++
		}

		Value = append(Value, Atoi_res)
		err = stub.PutState(args[tmp], []byte(strconv.Itoa(Value[count])))
		if err != nil {
			return shim.Error(err.Error())
		}
	}
	return shim.Success(nil)
}

func (t *ManyArg) Invoke(stub shim.ChaincodeStubInterface) peer.Response {
	fmt.Println("INVOKE CHAINCODE")
	fn, args := stub.GetFunctionAndParameters()
	switch fn {
	case "invoke":
		return t.invoke(stub, args)
	case "delete":
		return t.delete(stub, args)
	case "query":
		return t.query(stub, args)
	default:
		return shim.Error("INVOKE OPTION NOT FOUND")
	}
}

func (t *ManyArg) invoke(stub shim.ChaincodeStubInterface, args []string) peer.Response {
	if len(args) != 3 {
		return shim.Error("NEED 3 ARG FUNC: INVOKE")
		//0 : entity 1 : Value 2 : delimiter
	}

	var Val1, Val2 int = 0, 0
	var err error
	var delimiter string = args[2]
	Val1Byte, err := stub.GetState(args[0])
	if err != nil {
		return shim.Error("FAILED TO GET STATE FUNC: INVOKE")
	}
	if Val1Byte == nil {
		return shim.Error("ENTITY NOT FOUND FUNC: INVOKE")
	}
	Val1, _ = strconv.Atoi(string(Val1Byte))
	Val2, _ = strconv.Atoi(args[1])

	switch delimiter {
	case "+":
		Val1 += Val2
	case "-":
		Val1 -= Val2
	case "*":
		Val1 *= Val2
	case "/":
		Val1 /= Val2
	}

	err = stub.PutState(args[0], []byte(strconv.Itoa(Val1)))
	if err != nil {
		return shim.Error(err.Error())
	}

	return shim.Success(nil)
}
func (t *ManyArg) delete(stub shim.ChaincodeStubInterface, args []string) peer.Response {
	if len(args) != 1 {
		return shim.Error("NEED 1 ARG FUNC : DELETE")
	}

	err := stub.DelState(args[0])
	if err != nil {
		return shim.Error("FAILED TO DELETE  FUNC : DELETE")
	}
	return shim.Success(nil)
}
func (t *ManyArg) query(stub shim.ChaincodeStubInterface, args []string) peer.Response {
	if len(args) != 1 {
		return shim.Error("NEED 1 ARG FUNC : QUERY")
	}

	ValueByte, err := stub.GetState(args[0])
	if err != nil {
		jsonResp := "{\"Error\":\"Failed to get state for " + args[0] + "\"}"
		return shim.Error(jsonResp)
	}

	if ValueByte == nil {
		jsonResp := "{\"Error\":\"Nil amount for " + args[0] + "\"}"
		return shim.Error(jsonResp)
	}

	jsonResp := "{\"Name\":\"" + args[0] + "\",\"Amount\":\"" + string(ValueByte) + "\"}"
	fmt.Printf("Query Response:%s\n", jsonResp)
	return shim.Success(ValueByte)

}
