package main

import "fmt"

type Rule struct {
	Length int
	Range  []int
	Count  int
}

func (r Rule) is_even() int {
	r.Count = 0

	for i := range r.Range {
		if r.Range[i]%2 == 0 {
			return r.Count + 1
		}
	}

	return r.Count
}

// Example Notification Submodule
type Notification struct {
	Id       int
	NotTitle string
	NotDesc  string
}

func (n Notification) New() {
	fmt.Printf("%d, %s, %s\n", n.Id, n.NotTitle, n.NotDesc)
}

func (n Notification) Delete() bool {
	fmt.Printf("Deleting %d, Deleting %s, Deleting %s\n", n.Id, n.NotTitle, n.NotDesc)
	return false
}

func (n Notification) NotifyFriend() bool {
	fmt.Println("Gabriel deleted Hugo notifications")
	return true
}

func (n Notification) DeleteRecord() {
	fmt.Printf("Notification id = %d deleted", n.Id)
}

type NotificationFunc func()
type False func() bool

type NotificationsModule struct {
	Notification Notification
	New          NotificationFunc
	Delete       False
}

// Example Person Submodule
type Person struct {
	Id               int
	Name             string
	ReadNotification bool
}

func (p Person) CheckView() {
	fmt.Printf("%d, %s, %t", p.Id, p.Name, p.ReadNotification)
}

func (p Person) DeleteNotification() bool {
	fmt.Println("Notification Deleted Succesfully")
	return true
}

type PersonFunc func()

type PersonModule struct {
	Person    Person
	CheckView PersonFunc
}

type App struct {
	Notifications NotificationsModule
	Persons       PersonModule
}

func (app App) Run() {
	if !app.Notifications.Delete() {
		fmt.Printf("%s Deleted all their notifications \n", app.Persons.Person.Name)
	}
}

type IsDeletable interface {
	Delete() bool
}

type SmartOps interface {
	DeleteRecord()
}

var d IsDeletable = Notification{2, "foo", "bar"}
var smart SmartOps = Notification{3, "baz", "bar"}

func DeleteRecord(id int, table string) {
	fmt.Printf("Notification %d deleted successfully from %s", id, table)
}

func main() {
	// var list = []int{1, 2, 3, 4, 5, 6, 7, 8}
	// var length int

	// fmt.Printf("%d\n", Rule.is_even(Rule{Range: list, Length: length}))

	n := Notification{1, "Hello", "World"}
	notificationModule := NotificationsModule{n, n.New, n.Delete}

	p := Person{1, "Gabriel", true}
	personModule := PersonModule{p, p.CheckView}

	app := App{
		Notifications: notificationModule,
		Persons:       personModule,
	}
	app.Run()
}
