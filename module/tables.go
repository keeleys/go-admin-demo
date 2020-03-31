package module

import "github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"

// The key of Generators is the prefix of table info url.
// The corresponding value is the Form and Table data.
//
// http://{{config.Domain}}:{{Port}}/{{config.Prefix}}/info/{{key}}
//
// example:
//
// "users" => http://localhost:9033/admin/info/users
//
// example end
//
var Generators = map[string]table.Generator{
	"users": GetUsersTable,

	// generators end
}
