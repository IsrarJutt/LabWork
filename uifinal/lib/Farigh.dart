
child: Row(
children: [
Center(
child: Container(
alignment: Alignment.center,
color: Colors.white,
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Center(
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
SizedBox(width: 15,),
MaterialButton(
child: Container(
decoration: BoxDecoration(
image: DecorationImage(
image: AssetImage('images/gogreen.jpg'),
fit: BoxFit.cover),
),
),
// ),
onPressed: () {
setState(() {
Navigator.push(context, MaterialPageRoute(builder: (context)=>Camera()));

});
},
),
SizedBox(width: 15,),
MaterialButton(
child: Container(
decoration: BoxDecoration(
image: DecorationImage(
image: AssetImage('images/gogreen.jpg'),
fit: BoxFit.cover),
),
),
// ),
onPressed: () {
setState(() {
Navigator.push(context, MaterialPageRoute(builder: (context)=>Gallery()));

});
},
),
]
),
),

]
)

),

)
]
)