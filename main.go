package main

import (
	_ "github.com/GoAdminGroup/go-admin/adapter/gin"
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/engine"
	"github.com/GoAdminGroup/go-admin/examples/datamodel"
	"github.com/GoAdminGroup/go-admin/modules/config"
	_ "github.com/GoAdminGroup/go-admin/modules/db/drivers/mysql"
	"github.com/GoAdminGroup/go-admin/plugins/admin"
	"github.com/GoAdminGroup/go-admin/template/types"
	_ "github.com/GoAdminGroup/themes/adminlte"
	"github.com/gin-gonic/gin"
	"go-admin-demo/module"
	"os"
)

func main() {
	r := gin.Default()
	eng := engine.Default()
	cfg := config.ReadFromJson("./config.json")
	dateConfig := cfg.Databases.GetDefault()
	fillEnv(&dateConfig)
	cfg.Databases.Add("default", dateConfig )

	adminPlugin := admin.NewAdmin(datamodel.Generators)

	adminPlugin.AddGenerator("user", datamodel.GetUserTable)
	for k,v := range module.Generators {
		adminPlugin.AddGenerator(k,v)
	}

	_ = eng.AddConfig(cfg).AddPlugins(adminPlugin).Use(r)
	println(module.Generators["users"])
	eng.HTML("GET", "/admin", func(ctx *context.Context) (panel types.Panel, err error) {
		return types.Panel{
			Content:   "",
			Title:       "首页",
			Description: "",
		}, nil
	} )
	_ = r.Run(":9033")
}

/**
fill env to database config
 */
func fillEnv(database * config.Database){
	envDefault := func(key string, val *string) {
		port, find :=os.LookupEnv(key)
		if find{
			*val = port
		}
	}
	envDefault("DB_PORT", &database.Port)
	envDefault("DB_HOST", &database.Host)
	envDefault("DB_NAME", &database.Name)
	envDefault("DB_PASS", &database.Pwd)
}