import Foundation

class Users{
    var nameAndLastName:String
    var dateOfBirth: String
    var dni: String
    var brothers: Int
    var email: String
    var sex: String
    var user: String?

    init(nameAndLastName:String, dateOfBirth:String, dni:String, brothers:Int, email:String, sex:String){
        self.nameAndLastName = nameAndLastName
        self.dateOfBirth = dateOfBirth
        self.dni = dni
        self.brothers = brothers
        self.email = email
        self.sex = sex
    }
    //OBTENER EDAD
    func getYearPerson() -> Int {
        var splitDate = dateOfBirth.split(separator: "/")
        var year = Int(splitDate[2])!
        var yearsOld = 2022 - year
        return yearsOld
    }
    //IMPRIMIR NOMBRE
    func printUser() -> String{
        var printNewNameUser = ""
        var splitName = nameAndLastName.split(separator: " ")
        if(splitName.count > 3 ){
            var name = splitName[0]
            var oneLastname = splitName[2]
            var twoLastname = splitName[3]
            printNewNameUser = "\(name.capitalized) \(oneLastname.capitalized) \(twoLastname.prefix(1))."
        }else{
            var name = splitName[0]
            var oneLastname = splitName[1]
            var twoLastname = splitName[2]
            printNewNameUser = "\(name.capitalized) \(oneLastname.capitalized) \(twoLastname.prefix(1))."
        }
        return printNewNameUser
    }
    //CREAR NOMBRE DE USUARIO
    func createUserName()-> String{
        var username = email.split(separator: "@")
        var userName = username[0]
        return "\(userName)"
    }
}

let user1 = Users(nameAndLastName:"CARLOS JOSÉ ROBLES GOMES,",
                  dateOfBirth :"06/08/1995",
                  dni:"78451245",
                  brothers:2,
                  email: "carlos.roblesg@hotmail.com",
                  sex: "M")

let user2 = Users(nameAndLastName:"MIGUEL ANGEL QUISPE OTERO",
                  dateOfBirth :"28/12/1995",
                  dni:"79451654",
                  brothers:0,
                  email: "miguel.anguel@gmail.com",
                  sex: "M")

let user3 = Users(nameAndLastName:"KARLA ALEXANDRA FLORES ROSAS",
                  dateOfBirth :"15/02/1997",
                  dni:"77485812",
                  brothers:1,
                  email: "Karla.alexandra@hotmail.com",
                  sex: "F")
let user4 = Users(nameAndLastName:"NICOLAS QUISPE ZEBALLOS",
                  dateOfBirth :"08/10/1990",
                  dni:"71748552",
                  brothers:1,
                  email: "nicolas123@gmail.com",
                  sex: "M")
let user5 = Users(nameAndLastName:"PEDRO ANDRE PICASSO BETANCUR",
                  dateOfBirth :"17/05/1994",
                  dni:"74823157",
                  brothers:2,
                  email: "pedroandrepicasso@gmail.com",
                  sex: "M")
let user6 = Users(nameAndLastName:"FABIOLA MARIA PALACIO VEGA",
                  dateOfBirth :"02/02/1992",
                  dni:"76758254",
                  brothers:0,
                  email: "fabi@hotmail.com",
                  sex: "F")



var listUsers = [Users]()

listUsers.append(user1)
listUsers.append(user2)
listUsers.append(user3)
listUsers.append(user4)
listUsers.append(user5)
listUsers.append(user6)

//IMPRIMIR NOMBRE
print("\n")
print("NOMBRES DE USUARIOS")
for user in listUsers{
    print(user.printUser())
}

//EDADES
print("\n")


var listYears = listUsers.sorted{ $0.getYearPerson() > $1.getYearPerson()}
var yearMax = listYears[0].printUser()
var yearMin = listYears[listYears.count-1].printUser()
print("Usuario Mayor: \(yearMax)")
print("Usuario Menor: \(yearMin)")

//LISTAS SEGÚN EL SEXO
print("\n")
let filterM = listUsers.filter{$0.sex == "M"}
let filterF = listUsers.filter{$0.sex == "F"}
print("CANTIDAD SEGÚN EL SEXO")
print("CANTIDAD DE HOMBRES: \(filterM.count)")
print("CANTIDAD DE MUJERES: \(filterF.count)")


//LISTA DE PERSONAS QUE TIENEN MÀS DE DOS HERMANOS

let filterBrothers = listUsers.filter{$0.brothers > 2}
if(filterBrothers.count > 0){
    print("\n")
    print("LISTA DE USUARIOS QUE TIENEN MAS DE 2 HERMANOS:")
    for brother in filterBrothers {
        print(brother.nameAndLastName)

    }
}

//LISTA DE USUARIOS
print("\n")
print("LISTA DE NOMBRE DE USARIOS")
for user in listUsers {
    print(user.createUserName())
}


