USE [WatchStoreManagementss]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/28/2021 4:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountRoles]    Script Date: 5/28/2021 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountRoles](
	[AccountRoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_dbo.AccountRoles] PRIMARY KEY CLUSTERED 
(
	[AccountRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/28/2021 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[AccountRoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/28/2021 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/28/2021 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderId] [int] NOT NULL,
	[WatchId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[WatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/28/2021 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ShippedDate] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[ShipAddress] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](10) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 5/28/2021 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[PromotionId] [int] IDENTITY(1,1) NOT NULL,
	[PromotionName] [nvarchar](max) NOT NULL,
	[Percent] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Promotions] PRIMARY KEY CLUSTERED 
(
	[PromotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 5/28/2021 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[PublisherId] [int] IDENTITY(1,1) NOT NULL,
	[PublisherName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.Publishers] PRIMARY KEY CLUSTERED 
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/28/2021 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[City] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[BirthDate] [datetime] NOT NULL,
	[Photo] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Watches]    Script Date: 5/28/2021 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Watches](
	[WatchId] [int] IDENTITY(1,1) NOT NULL,
	[WatchName] [nvarchar](200) NOT NULL,
	[ImageUrl] [nvarchar](50) NOT NULL,
	[SmallImage] [nvarchar](50) NULL,
	[Description] [nvarchar](1000) NULL,
	[Evaluate] [nvarchar](1000) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[PricePromotion] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[PublisherId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Watches] PRIMARY KEY CLUSTERED 
(
	[WatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WatchPromotion]    Script Date: 5/28/2021 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchPromotion](
	[WatchId] [int] NOT NULL,
	[PromotionId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.WatchPromotion] PRIMARY KEY CLUSTERED 
(
	[WatchId] ASC,
	[PromotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202105071506482_InitialCreate', N'ShopWatch.Model.DataContext.ShopWatchDataContext', 0x1F8B0800000000000400E55DDB6EE4B8117D0F907F10F49404B36EDB830536467B179EF63830763D76A66736793368896E0BD1A523A91D1B41BE2C0FF9A4FC42A82BEF144951EA1E077E69F3522C164F15C92259FAEFBFFFB3FCE92589BD67981751969EFB2747C7BE07D3200BA37473EEEFCAC7EF7EF07FFAF1B7BF597E0C9317EFD7AEDCFBAA1CAA9916E7FE53596ECF168B22788209288E9228C8B3227B2C8F822C5980305B9C1E1FFF717172B28088848F6879DEF2F32E2DA304D6FFA07F57591AC06DB903F14D16C2B868D351CEBAA6EA7D02092CB62080E7FEFA29DBFE0594C1D3515DF6E8129400D52FE14BE97B177104104B6B183FFA1E48D3AC042562F8EC6B01D7659EA59BF5162580F8CBEB16A2728F202E60DB91335C5CB74FC7A7559F16B862472AD815659618123C79DF0A69C156B712B5DF0B1189F1231277F95AF5BA16E5B97F1104191A83CF598CFACFB677B68AF3AA2C2F6CA2DA3B8FC97CD7C303A1A8FA7BE7AD7671B9CBE1790A77650E5089BBDD431C053FC3D72FD9DF607A9EEEE298E413718AF2A804947497675B9897AF9FE123CFFD75E87B0B9AC482A5D15310576FBA7A9D96EF4F7DEF1362093CC4B0070721967599E5F04F30853928617807CA12E6686CAF43588B97638469B66AAFFAD5B5881089B4CCF76EC0CB2F30DD944F48FF8E915E5D452F30EC525A2EBEA611524A54A9CC7750C0A5BAE54B580479B46DB0A46ADC41EBCB05069B0E042DE07700D01B01BB3921D7363980BAEF2701DD1D288A7F6479387BC3AB1C2261A179A1EF73F5FB4B94989342E88A1E23183A2166647618529FC073B4A9212127EA7B9F615C97299EA26D330B762A734F95BBCAB3A4FAD55727B3EFD7D92E0FAAEE66F2325F40BE81A5A5E6AF90043759FE6AA2FA5D9D7DEA7EC7838DF29375E7D2FEAECDB73FE9A834A4C60A2C84DA51E7DD633C62C5A0737ABC773AC164772A63A50E352D135DA87FEF5311EA566DB4A0AF38970AD40D0EE0FF741AFC5F276003BFE6F1ECF3DF3A01715CB73EBEE959555CDDD8C76710EF887978BA96EEF228C0D33D0C222450DFBBCBD1AF769BFC83EFAD03508D88C6DC2DA28ED2928C949BF366FEBC03AD86182D34846B2937EB1FA78BA9EBE22228A3E79ED0870CD965909A77507B5E1E18D5CAB2164F3077B7B4C3D3D298998B5DCD4926365DA66EF310E697B004512C9E528902F7EDCC8679E332B989952F219A5B551CF6AAA59AF2C942ACE8709E4478440153F1F53051F186CB70AC755932CEFAFC510B7462104CD62544B57DAE4E6A36F8D589DB954CDFC818A3A1B91C9AC3D0A309B2743CEFA96D88DC78DCD33686B11E54AED87CD0454CED476BB4C69B365645E5C6CF5E498DD5F30015D399B239DC391FEAB2678DD0B875450BC96A57F4CBE90AE15D920557176198C3A298DFCF70F794A5F0D32E79A8B441D1F8146D7F2D5C2EF8F4D65626E6516882C4165497C9AACB0AE69A6C96A92A55C24C9D35CA10364DEADBC1AAFC3ECD60071A532BA80736774670C06DF27E1AE73DB19299AD5177B64BDDCE87282F9F9CD86E64F4CA4CC12FFAE9C2E592D43B80B90F8E2A83AEF4D74D8201DDD339C39319A1ADAC8D5E5F005B4B329DB39754A6D5BE5D35AB280CB778914DD9742BC34D38C1F4AD775F699F26BC67C2C68E5395E732E67DA303565DD77098EA344430A9B03E668F8A56A779E9C47C7E4C2D97D0234E99345D4EE29326814FCA4EE5B06FC940E5BA4A7B5539D2C16AAC72FADE59872AD735FA7F71FE2A3AFD9AA1D3631452C7CF2A5147CE0FABA78DBB84D0C56EB37D5D5CC56083AF23EA2B6645B0DDB33B534D340068768F5FD180918A424BFD0656DBED5ED251894A5FC2387A86D559C4AF20DEA1F4636EB0A86A6DF91A186D8D13758DAB284542EF4B9FAA4BAF401AC03886615FE13D3F4CCD80908917459105512D787A21475DA1A1DB45D389A7719F06FB59FAA5DF0D1A92688B0601C1E5DCFF03D72335E51E9C1CE5E69E0F4DFDC467ADEC6D8A060196D0ABCED22A07EF0A140108792D43920AE9146498615ED94110AF906E213C4569C95BF1280DA22D8887FBC05435BFF65971D9B7C7E65CC22D4C2BB33D3C4C4E18E9DB63C43824B5E582809F1A95CC01A00C36B2D3408C98D693AD8F44D9D5184C121F4B1E1A02C5BCEB8CB9FCF29711F2C4E3319E81191027F03ECA20A272456298B42718136244C99100B8D4C1E790465801502E191D0CC88F36F5112897C4480E668020E537910DB5D8898207B9F174E8DB3BA1DF657832DFBFB113316E30BD8DC499681846B73E9B99AB41A23626F4A1C6805953014CE46A53C375FFD8E279D6195BF1D18785F922653FAEE1B91045DD1B5022417C89C0729252D116804DB8183C10B48978D7197BC91D1F73D48906662403B36D1408EFA37A5D2FBAFD367AB320F26F62A2C4398092B079A77B0FCF007BFCB5BAF15DE65D48448FB1EBE9D0544DC2BD0ECE152E5A8B3D1237280E5870AE6E8DA3AF7A7F8C6AF4AEA7DE15473D4EE6FC7A68526A5D7B45EBEE642155115FC392773B14BE877D8C22D70F874E212905994112ED7E3412F2823D0003547A372D47A2D5BB81FAF465188E083557EA90921219AC5E2D3144B59BF5DB4065F27088A340D8C721321DFC8564B0D161C810E0E62042BF1C244A2A1E18B27AA7E71FED3B43C293D3613D8F284FABD51AD668D25DD7100B7BF19E9788CA33A7E39B2378EFB5432106893B8EA0426AEAE8FE8BEEA0F13218F215E97A8B885E74EAA91085C2C9C312EA791F2D10FA2E072F0AB9CF62D86B4170DD9A1745EF857E0A0DA5B2064163D96483CFEFA087F6D036834DED9A87C465DB53FACEB7A4C3F20D9EE6164F13A29A9BBA612B626DFCC8C94A66FE64FB0DBD1D879509146C32083A24D3AEE4802754A918C43B10AD3D889D10B86D0729036279A02D83EE34BB5FE4F679CB45139EA74D582E24717C963760BB8DD20D11D7A74DF1D64D509FD5776BF320374943631150106397E47D4B6596830D647251D388D3AB282FAA8B45E0015407F0AB30E18A0997F492C558D7A460D5CE0F5FB748EB2A55BF995D041FE9E848B1DAC2D2BD421D4EAA6D557D9145BC24E26B7B55D42510835C1DBE6295C5BB24D53A0F95D3C42171487238559F1275DB85244665F0F4960B4658DC9E911B226EDB4D0FBB09289C03C21E0CC6409080C00C0054801A01355318E0A03324319CAA4F898C2243D222D3F5A9D18F80487A748EB1E4ACD4714FA027F621AE602FDB6569E05E5E550A09E2049E8284E2647E981A8F7D3AE7CDDAC06E51E30A0BC295B7061024F56452EEBDF9A484A52EFE013AFCE013C9FAB470AC1192144ED5A744060F216991E9D32352460FC7002189E1548389A279EB4CCD124D92210DC239C711933AEE5454F17B6E921E4E359DC204730E95B1CF490C47F1A070DBA79A5B5337B6993A46A0865575BEB0374B3AE067B333A7A4EBDCDCA82A6BCBC4DE5F2E22452EBD7124A7E3CA44BB534522BC02498A483E2C303986912D80E687CEE1DB4C2A04003545931906F4DA670814A936CD8CABFE192DCB559F616081C957FD940526330C14B0E0E121BB14B437D56B9CD6AE344FE480D7503C713537729551E197C1A62BE01567A65786265A885E0BE4128FBC494A44B2911654CFBC19FC5749066BE6E61137B5604E04E7E1037CA4EC6AB94932765818B98DF6A487CAC30B3B65C45B01738D54D4956F4D8837C6F4BE44FA72598B1EAFA94C9601CDEE4D3045AD4B349AC0BA67C1CC1CD6251B284B2A9858FBC4C301283EC8710650D949950E40E5755DEFB006E909004A67EDCF7B2170AB483D2A53038B3EEE1338E6A8535E03071C554FE86A939AB3EA3053B493139C10F3F272B011ACAF5076142C78935E957468A2E53CB247B8FCB07327B96C911E74FD892E7372BB6C4F51873FD3C21DAB3645AA7082D97314D647AAAF4509931A4147EBBFC7AB38AA0D7F57E006A4D1232CCAE66DB27F7A7C72CA7CE0E5703EB6B2288A30169C4213AFBDE5AF87F7F6C993A812F7609003C387FFEC574ED26790074F20E75FFF8F8F6720A33D44DCF81B25F603E6E44321930C94E0DB2042797E6F3E54ECA73F5CD1E5BFEC11A2DFA5ABA88CD6C4E4DAC5DDF9BE4E43F872EEFFB3AE79E65DFFF59EAAFCCEAB7D5667DEB1F72F572096BC11DFC3272F26C1B1E82B17DFB4D1113D119BF5B30C930C13F72506A11C4F2DC688FDD0822B6BC37F474183B2E56713B44065F395046784A9E0D0E13C1F4570DE0C1B2BBB46FAF84F221CC62CC47E12E121B2E89CD8666B4C63B8A6C11C2600021FA94B9703A2EA14D3A8F444F370A3D2EB4AAEAD366AE044738846D36DB5514DBBD06A2EFEFD48DB6318C6DD1DA0EC40E27C5176A846521040DD9E161540DD067582C0E9CE96AE82B8E812DA23C39EEBAA7A536B0AD32C08D6316324EE49146870A5FCDE62FB4CD84857342DD06B1529DB5A49A948D91D7BBF4BC0CBEF8D97D664346C67AE1232D8B5644B343E96B5A12F621A2D95F8FDF713717912A5658E420730671338D96A9261C3265BEB12133659938E4570621B80388E0F3C0D404421810FD15925F1B28C64D9CC0536CA5EC80FF91CDB963DEE7B64664D67AF8CAB3A30F54E62E636012664F14C660912D9BFE21F8EEEE7281CA4FA1DA7E131A0671102F7ADC5BBC5813984D1686681511B27C03C86941584144FE04CCE738CC0237B6A65DAE00146ADDD6F84DA2E54916DB83FFBE87AF3C69F95BE2B316AF35022CE1ACC1B1381A709C5C2459D9A72CE9A3994EC5B891DAB3552539A189B58B5D6E187678D0AFB9622C16AAE21DEDC5CA4BFB2701CD6F51B8CE42ABC0C7B301862F6F01C1B44D61B4092FA66F3B70026D1ED656238C523291DC4370A2AB3111EB8C93D25B8069A9E0F6083219889286AE260A56F70CFAE7A6C63E4DA9E68D77E186194F9D06CECE849E3230F85476E5E239CFBE1437536D8383C958162256DA9E2272BDA18A68F5D565C03384BD48222D82BDB468B70AE81365D445D164A92254D2D14B906A85C5133CA10ADC2B6E4619BA5F48729375B338E70932CA22B8E3ACA922526298E3691276A807C5C35D40AB6A07C2B384FD88A3C4EA41043AA0EB105A4A822CA306DCE1E9E9AB4205CC044DE1E0A1C417C5D7E36DA67E869D6BCD011D1545DA48C06113F6B7CF7A68A2CCD47D655765060BAB88836E33BEB286AB401E0045E2836EA83AB311C15185A8B359B513E84E8CF9ADAB307404A63310F4778963CCA1DD96DF1CC227A463C41E7BBE0C91A9D17BFFA15EF9C85411D0E4C086E825A73AB0F2650C0B4538C41CC6AFE4533DAC720F31925CD1507B48B2AA20D26B144345318503B98BECC75FA9875BB2986A3AE087BB919E96F88B6371779193D82A044D9012C0AF2ABC81F9307185EA7B7BB72BB2B519761F210537374B52153B55F07E6A6795EDED6D7840A175D406C46D555B0DBF4C32E8AF1E796AF0417482424AA9D5E7BCDAA1ACBB2BA6EB5C15F92FEC4859A91116AC5D76F50BFC0641B2362C56DBA06D5D31873DED0F4F30BDC80E0F5AE7D982E27323C10B4D8979711D8E420295A1AB83EFA1761384C5E7EFC1F909BA9C1A5A50000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[AccountRoles] ON 

INSERT [dbo].[AccountRoles] ([AccountRoleId], [RoleName], [Description]) VALUES (1, N'Customer', N'Là khách hàng của website')
INSERT [dbo].[AccountRoles] ([AccountRoleId], [RoleName], [Description]) VALUES (2, N'Admin', N'Là người quản trị trang web')
SET IDENTITY_INSERT [dbo].[AccountRoles] OFF
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountId], [AccountName], [Password], [CreateDate], [ModifiedDate], [AccountRoleId]) VALUES (3, N'admin', N'123@abcd', CAST(N'2021-05-07T22:06:53.103' AS DateTime), CAST(N'2021-05-07T22:06:53.103' AS DateTime), 2)
INSERT [dbo].[Accounts] ([AccountId], [AccountName], [Password], [CreateDate], [ModifiedDate], [AccountRoleId]) VALUES (4, N'tungnguyen', N'Cuocdoi1', CAST(N'2021-05-07T22:17:56.960' AS DateTime), CAST(N'2021-05-20T13:20:00.620' AS DateTime), 1)
INSERT [dbo].[Accounts] ([AccountId], [AccountName], [Password], [CreateDate], [ModifiedDate], [AccountRoleId]) VALUES (5, N'manhnguyen', N'taochiu1', CAST(N'2021-05-27T21:36:42.207' AS DateTime), CAST(N'2021-05-27T21:36:42.207' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description]) VALUES (1, N'Đồng hồ nam', N'Đồng hồ dành cho nam giới')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description]) VALUES (2, N'Đồng hồ nữ', N'Đồng hồ dành cho nữ giới')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description]) VALUES (3, N'Đồng hồ trẻ em', N'Đồng hồ dành cho trẻ em')
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[OrderDetails] ([OrderId], [WatchId], [Quantity], [UnitPrice]) VALUES (1, 4, 1, CAST(452424.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [WatchId], [Quantity], [UnitPrice]) VALUES (1, 12, 1, CAST(10930000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [WatchId], [Quantity], [UnitPrice]) VALUES (2, 6, 2, CAST(310000000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [WatchId], [Quantity], [UnitPrice]) VALUES (3, 2, 1, CAST(10980000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [WatchId], [Quantity], [UnitPrice]) VALUES (4, 6, 1, CAST(310000000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [WatchId], [Quantity], [UnitPrice]) VALUES (5, 1, 1, CAST(11930000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [WatchId], [Quantity], [UnitPrice]) VALUES (6, 11, 1, CAST(6050000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [WatchId], [Quantity], [UnitPrice]) VALUES (7, 6, 1, CAST(310000000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [WatchId], [Quantity], [UnitPrice]) VALUES (8, 4, 1, CAST(11725000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [WatchId], [Quantity], [UnitPrice]) VALUES (9, 1, 1, CAST(11930000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [WatchId], [Quantity], [UnitPrice]) VALUES (10, 10, 1, CAST(11930000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [WatchId], [Quantity], [UnitPrice]) VALUES (11, 8, 1, CAST(7800000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [WatchId], [Quantity], [UnitPrice]) VALUES (12, 11, 1, CAST(6050000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [WatchId], [Quantity], [UnitPrice]) VALUES (13, 10, 1, CAST(11930000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [WatchId], [Quantity], [UnitPrice]) VALUES (14, 4, 1, CAST(11725000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [CreatedDate], [ModifiedDate], [ShippedDate], [Status], [ShipAddress], [PhoneNumber], [UserId]) VALUES (1, CAST(N'2021-05-07T22:19:46.000' AS DateTime), CAST(N'2021-05-07T22:19:46.000' AS DateTime), CAST(N'2021-05-11T22:19:46.000' AS DateTime), 2, N'277 quan hoahà nam', N'0915359769', 3)
INSERT [dbo].[Orders] ([OrderId], [CreatedDate], [ModifiedDate], [ShippedDate], [Status], [ShipAddress], [PhoneNumber], [UserId]) VALUES (2, CAST(N'2021-05-07T22:29:01.000' AS DateTime), CAST(N'2021-05-07T22:29:01.000' AS DateTime), CAST(N'2021-05-11T22:29:01.000' AS DateTime), 2, N'277 quan hoahà nam', N'0915359769', 3)
INSERT [dbo].[Orders] ([OrderId], [CreatedDate], [ModifiedDate], [ShippedDate], [Status], [ShipAddress], [PhoneNumber], [UserId]) VALUES (3, CAST(N'2021-05-08T09:52:03.000' AS DateTime), CAST(N'2021-05-08T09:52:03.000' AS DateTime), CAST(N'2021-05-12T09:52:03.000' AS DateTime), 2, N'277 quan hoahà nam', N'0915359769', 3)
INSERT [dbo].[Orders] ([OrderId], [CreatedDate], [ModifiedDate], [ShippedDate], [Status], [ShipAddress], [PhoneNumber], [UserId]) VALUES (4, CAST(N'2021-05-09T14:31:06.000' AS DateTime), CAST(N'2021-05-09T14:31:06.000' AS DateTime), CAST(N'2021-05-13T14:31:06.000' AS DateTime), 2, N'277 quan hoahà nam', N'0915359769', 3)
INSERT [dbo].[Orders] ([OrderId], [CreatedDate], [ModifiedDate], [ShippedDate], [Status], [ShipAddress], [PhoneNumber], [UserId]) VALUES (5, CAST(N'2021-05-09T20:05:11.000' AS DateTime), CAST(N'2021-05-09T20:05:11.000' AS DateTime), CAST(N'2021-05-13T20:05:11.000' AS DateTime), 1, N'277 quan hoahà nam', N'0915359769', 3)
INSERT [dbo].[Orders] ([OrderId], [CreatedDate], [ModifiedDate], [ShippedDate], [Status], [ShipAddress], [PhoneNumber], [UserId]) VALUES (6, CAST(N'2021-05-21T10:00:23.000' AS DateTime), CAST(N'2021-05-21T10:00:23.000' AS DateTime), CAST(N'2021-05-25T10:00:23.000' AS DateTime), 1, N'277 quan hoahà nam', N'0915359769', 3)
INSERT [dbo].[Orders] ([OrderId], [CreatedDate], [ModifiedDate], [ShippedDate], [Status], [ShipAddress], [PhoneNumber], [UserId]) VALUES (7, CAST(N'2021-05-21T23:13:16.000' AS DateTime), CAST(N'2021-05-21T23:13:16.000' AS DateTime), CAST(N'2021-05-25T23:13:16.000' AS DateTime), 1, N'277 quan hoahà nam', N'0915359769', 3)
INSERT [dbo].[Orders] ([OrderId], [CreatedDate], [ModifiedDate], [ShippedDate], [Status], [ShipAddress], [PhoneNumber], [UserId]) VALUES (8, CAST(N'2021-05-23T22:50:53.000' AS DateTime), CAST(N'2021-05-23T22:50:53.000' AS DateTime), CAST(N'2021-05-27T22:50:53.000' AS DateTime), 1, N'277 quan hoahà nam', N'0915359769', 3)
INSERT [dbo].[Orders] ([OrderId], [CreatedDate], [ModifiedDate], [ShippedDate], [Status], [ShipAddress], [PhoneNumber], [UserId]) VALUES (9, CAST(N'2021-05-23T23:09:20.000' AS DateTime), CAST(N'2021-05-23T23:09:20.000' AS DateTime), CAST(N'2021-05-27T23:09:20.000' AS DateTime), 1, N'277 quan hoahà nam', N'0915359769', 3)
INSERT [dbo].[Orders] ([OrderId], [CreatedDate], [ModifiedDate], [ShippedDate], [Status], [ShipAddress], [PhoneNumber], [UserId]) VALUES (10, CAST(N'2021-05-23T23:32:39.000' AS DateTime), CAST(N'2021-05-23T23:32:39.000' AS DateTime), CAST(N'2021-05-27T23:32:39.000' AS DateTime), 3, N'277 quan hoahà nam', N'0915359769', 3)
INSERT [dbo].[Orders] ([OrderId], [CreatedDate], [ModifiedDate], [ShippedDate], [Status], [ShipAddress], [PhoneNumber], [UserId]) VALUES (11, CAST(N'2021-05-23T23:56:18.000' AS DateTime), CAST(N'2021-05-23T23:56:18.000' AS DateTime), CAST(N'2021-05-27T23:56:18.000' AS DateTime), 3, N'277 quan hoahà namgegregerg', N'0915359769', 3)
INSERT [dbo].[Orders] ([OrderId], [CreatedDate], [ModifiedDate], [ShippedDate], [Status], [ShipAddress], [PhoneNumber], [UserId]) VALUES (12, CAST(N'2021-05-24T00:00:14.000' AS DateTime), CAST(N'2021-05-24T00:00:14.000' AS DateTime), CAST(N'2021-05-28T00:00:14.000' AS DateTime), 3, N'ddoox duc duc', N'0915359769', 3)
INSERT [dbo].[Orders] ([OrderId], [CreatedDate], [ModifiedDate], [ShippedDate], [Status], [ShipAddress], [PhoneNumber], [UserId]) VALUES (13, CAST(N'2021-05-24T00:19:00.000' AS DateTime), CAST(N'2021-05-24T00:19:00.000' AS DateTime), CAST(N'2021-05-28T00:19:00.000' AS DateTime), 3, N'277 quan hoahà nam', N'0915359769', 3)
INSERT [dbo].[Orders] ([OrderId], [CreatedDate], [ModifiedDate], [ShippedDate], [Status], [ShipAddress], [PhoneNumber], [UserId]) VALUES (14, CAST(N'2021-05-24T17:53:00.900' AS DateTime), CAST(N'2021-05-24T17:53:00.900' AS DateTime), CAST(N'2021-05-28T17:53:00.900' AS DateTime), 0, N'277 quan hoahà nam', N'0915359769', 3)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Promotions] ON 

INSERT [dbo].[Promotions] ([PromotionId], [PromotionName], [Percent], [StartDate], [EndDate]) VALUES (1, N'sale cuối tháng 5', 20, CAST(N'2021-05-21T00:00:00.000' AS DateTime), CAST(N'2021-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotions] ([PromotionId], [PromotionName], [Percent], [StartDate], [EndDate]) VALUES (2, N'sale dịch covid', 25, CAST(N'2021-05-25T00:00:00.000' AS DateTime), CAST(N'2021-05-31T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Promotions] OFF
SET IDENTITY_INSERT [dbo].[Publishers] ON 

INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Description], [Image]) VALUES (1, N'Tissot', N'Tissot là một trong số những thương hiệu đồng hồ sang trọng đến từ Thụy Sĩ.Thương hiệu được thành lập tại thị trấn Le Locle, Thụy Sĩ bởi nghệ nhân chế tác đồng hồ Charles-Felicien và con trai Charles-Emile Tissot vào năm 1853', N'p1.jpg')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Description], [Image]) VALUES (2, N'Calvin Klein', N'Calvin Klein là một nhãn hiệu thời trang được nhà thiết kế cùng tên Calvin Klein thành lập năm 1968. Công ty có trụ sở tại Midtown Manhattan, New York City[1] và hiện tại do Phillips-Van Heusen (PVH) sở hữu. Giống như các thương hiệu thời trang khác, Calvin Klein nổi tiếng với biểu tượng viết tắt của tên công ty là cK', N'p2.jpg')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Description], [Image]) VALUES (3, N'Rolex', N'Rolex với tên gọi chính xác là Rolex SA là một hãng sản xuất đồng hồ Thụy Sỹ với phân khúc từ cao cấp đến xa xỉ và sang trọng. Rolex SA bao gồm hai thương hiệu là Rolex và Montres Tudor SA chuyên thiết kế, sản xuất, phân phối đồng hồ đeo tay dưới thương hiệu Rolex và Tudor.', N'p3.jpg')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Description], [Image]) VALUES (5, N'LA', N'<p>&aacute;dasdasđ&aacute;</p>
', N'p4.jpg')
SET IDENTITY_INSERT [dbo].[Publishers] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Name], [City], [Address], [BirthDate], [Photo], [Email], [Phone], [AccountId]) VALUES (3, N'Nguyễn Xuân Tùng', N'hà nam', N'277 quan hoa', CAST(N'1999-10-08T00:00:00.000' AS DateTime), N'', N'tung@gmail.com', N'0915359769', 4)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Watches] ON 

INSERT [dbo].[Watches] ([WatchId], [WatchName], [ImageUrl], [SmallImage], [Description], [Evaluate], [Price], [PricePromotion], [Quantity], [CreatedDate], [ModifiedDate], [IsActive], [CategoryId], [PublisherId]) VALUES (1, N'Đồng hồ Tissot T106.417.16.031.00', N'SP00001.jpg', N'SP00001', N'Đồng hồ nam, Dây da, Vỏ Thép không gỉ 316L/Mạ PVD, Kính sapphire, Bảo hành toàn quốc 2 năm', N'Đồng hồ cao cấp, xứng đáng với giá tiền', CAST(11930000.00 AS Decimal(18, 2)), CAST(9544000.00 AS Decimal(18, 2)), 98, CAST(N'2021-03-30T10:20:11.000' AS DateTime), CAST(N'2021-03-30T10:20:11.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Watches] ([WatchId], [WatchName], [ImageUrl], [SmallImage], [Description], [Evaluate], [Price], [PricePromotion], [Quantity], [CreatedDate], [ModifiedDate], [IsActive], [CategoryId], [PublisherId]) VALUES (2, N'Đồng hồ Tissot T085.410.22.013.00', N'SP00002.jpg', N'SP00002', N'Đồng hồ nam, Dây da, Thép không gỉ 316L/Mạ PVD, Kính sapphire, Bảo hành toàn quốc 2 năm, ', N'Đồng hồ cao cấp, xứng đáng với giá tiền', CAST(10980000.00 AS Decimal(18, 2)), CAST(10980000.00 AS Decimal(18, 2)), 199, CAST(N'2021-03-30T10:20:11.000' AS DateTime), CAST(N'2021-03-30T10:20:11.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Watches] ([WatchId], [WatchName], [ImageUrl], [SmallImage], [Description], [Evaluate], [Price], [PricePromotion], [Quantity], [CreatedDate], [ModifiedDate], [IsActive], [CategoryId], [PublisherId]) VALUES (3, N'Đồng hồ Tissot T063.617.36.037.00', N'SP00003.jpg', N'SP00003', N'Đồng hồ nam, Dây da, Vỏ Thép không gỉ 316L/Mạ PVD, Kính sapphire, Bảo hành toàn quốc 2 năm', N'Đồng hồ cao cấp, xứng đáng với giá tiền', CAST(14060000.00 AS Decimal(18, 2)), CAST(11248000.00 AS Decimal(18, 2)), 100, CAST(N'2021-03-30T10:20:11.000' AS DateTime), CAST(N'2021-03-30T10:20:11.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Watches] ([WatchId], [WatchName], [ImageUrl], [SmallImage], [Description], [Evaluate], [Price], [PricePromotion], [Quantity], [CreatedDate], [ModifiedDate], [IsActive], [CategoryId], [PublisherId]) VALUES (4, N'Đồng hồ Tissot Nữ T112.210.11.036.00', N'SP00004.jpg', N'SP00004', N'Tissot T-Wave toát lên vẻ đẹp thanh lịch, nhẹ nhàng qua những chi tiết thiết kế vô cùng tinh tế. Bộ vỏ tròn kết hợp hài hoà với kiểu dây to bản cùng chất mang đến sự hài hoà và bền bỉ cho tạo tác. Đại diện là chiếc Tissot T112.210.11.036.00 với vẻ ngoài thanh lịch, đầy né nữ tính.', N'Đồng hồ cao cấp, xứng đáng với giá tiền', CAST(11725000.00 AS Decimal(18, 2)), CAST(11725000.00 AS Decimal(18, 2)), 48, CAST(N'2021-03-30T10:20:11.000' AS DateTime), CAST(N'2021-03-30T10:20:11.000' AS DateTime), 1, 2, 1)
INSERT [dbo].[Watches] ([WatchId], [WatchName], [ImageUrl], [SmallImage], [Description], [Evaluate], [Price], [PricePromotion], [Quantity], [CreatedDate], [ModifiedDate], [IsActive], [CategoryId], [PublisherId]) VALUES (5, N'Đồng hồ Rolex GMT-MASTER II', N'SP00005.jpg', N'SP00005', N'<p>Giống với tất cả c&aacute;c phi&ecirc;n bản đồng hồ Chuy&ecirc;n dụng của Rolex, GMT-Master II mang lại sự r&otilde; n&eacute;t đặc biệt trong bất kỳ t&igrave;nh huống n&agrave;o, đặc biệt trong b&oacute;ng đ&ecirc;m, nhờ v&agrave;o hiển thị Chromalight của đồng hồ. C&aacute;c kim giờ v&agrave; điểm b&aacute;o giờ lớn h&igrave;nh dạng đơn giản - h&igrave;nh tam gi&aacute;c, h&igrave;nh tr&ograve;n, h&igrave;nh chữ chật - được phủ một loại chất liệu ph&aacute;t quang ph&aacute;t ra &aacute;nh s&aacute;ng bền bỉ.</p>
', N'Đồng hồ cao cấp, xứng đáng với giá tiền', CAST(15000000.00 AS Decimal(18, 2)), CAST(15000000.00 AS Decimal(18, 2)), 9, CAST(N'2021-03-30T10:20:11.000' AS DateTime), CAST(N'2021-05-27T19:25:58.377' AS DateTime), 1, 1, 3)
INSERT [dbo].[Watches] ([WatchId], [WatchName], [ImageUrl], [SmallImage], [Description], [Evaluate], [Price], [PricePromotion], [Quantity], [CreatedDate], [ModifiedDate], [IsActive], [CategoryId], [PublisherId]) VALUES (6, N'Đồng hồ Rolex DATEJUST 41', N'SP00006.jpg', N'SP00006', N'Đai kính rãnh Rolex là dấu ấn của sự khác biệt. Ban đầu, vành đồng hồ rãnh Oysterđược hình thành để xoắn chặt vành đồng hồ và vỏ đồng hồ một cách dễ dàng nhằm đảm bảo chống thấm nước tuyệt đối cho đồng hồ.', N'Đồng hồ cao cấp, xứng đáng với giá tiền', CAST(310000000.00 AS Decimal(18, 2)), CAST(310000000.00 AS Decimal(18, 2)), 11, CAST(N'2021-03-30T10:20:11.000' AS DateTime), CAST(N'2021-03-30T10:20:11.000' AS DateTime), 0, 1, 3)
INSERT [dbo].[Watches] ([WatchId], [WatchName], [ImageUrl], [SmallImage], [Description], [Evaluate], [Price], [PricePromotion], [Quantity], [CreatedDate], [ModifiedDate], [IsActive], [CategoryId], [PublisherId]) VALUES (7, N'Đồng hồ Rolex Oyster Perpetual Datejust 31', N'SP00007.jpg', N'SP00007', N'Đồng hồ Oyster Perpetual Datejust 31 bằng Oystersteel và vàng trắng đi kèm mặt số màu aubergine, nạm kim cương và dây đeo Oyster', N'Đồng hồ cao cấp, xứng đáng với giá tiền', CAST(5500000.00 AS Decimal(18, 2)), CAST(5500000.00 AS Decimal(18, 2)), 25, CAST(N'2021-03-30T10:20:11.000' AS DateTime), CAST(N'2021-03-30T10:20:11.000' AS DateTime), 1, 2, 3)
INSERT [dbo].[Watches] ([WatchId], [WatchName], [ImageUrl], [SmallImage], [Description], [Evaluate], [Price], [PricePromotion], [Quantity], [CreatedDate], [ModifiedDate], [IsActive], [CategoryId], [PublisherId]) VALUES (8, N'Đồng hồ Rolex Oyster Perpetual Datejust 36', N'SP00008.jpg', N'SP00008', N'Đồng hồ Oyster Perpetual Datejust 36 bằng Oystersteel và vàng vàng đi kèm mặt số màu champagne, nạm kim cương và dây đeo Oyster', N'Đồng hồ cao cấp, xứng đáng với giá tiền', CAST(7800000.00 AS Decimal(18, 2)), CAST(7800000.00 AS Decimal(18, 2)), 99, CAST(N'2021-03-30T10:20:11.000' AS DateTime), CAST(N'2021-03-30T10:20:11.000' AS DateTime), 1, 2, 3)
INSERT [dbo].[Watches] ([WatchId], [WatchName], [ImageUrl], [SmallImage], [Description], [Evaluate], [Price], [PricePromotion], [Quantity], [CreatedDate], [ModifiedDate], [IsActive], [CategoryId], [PublisherId]) VALUES (9, N'ĐỒNG HỒ CALVIN KLEIN MINIMAL K3M23V26', N'SP00009.jpg', N'SP00009', N'Đồng hồ nữ, Dây da, Vỏ Thép không gỉ 316L/Mạ PVD, Kính cứng, Bảo hành toàn quốc 1 năm', N'Đồng hồ cao cấp, xứng đáng với giá tiền', CAST(8030000.00 AS Decimal(18, 2)), CAST(8030000.00 AS Decimal(18, 2)), 32, CAST(N'2021-03-30T10:20:11.000' AS DateTime), CAST(N'2021-03-30T10:20:11.000' AS DateTime), 1, 2, 2)
INSERT [dbo].[Watches] ([WatchId], [WatchName], [ImageUrl], [SmallImage], [Description], [Evaluate], [Price], [PricePromotion], [Quantity], [CreatedDate], [ModifiedDate], [IsActive], [CategoryId], [PublisherId]) VALUES (10, N'Đồng hồ Tissot T106.417.16.031.00', N'SP00010.jpg', N'SP00010', N'Đồng hồ nữ, Dây da, Vỏ Thép không gỉ 316L/Mạ PVD, Kính sapphire, Bảo hành toàn quốc 1 năm', N'Đồng hồ cao cấp, xứng đáng với giá tiền', CAST(11930000.00 AS Decimal(18, 2)), CAST(11930000.00 AS Decimal(18, 2)), 98, CAST(N'2021-03-30T10:20:11.000' AS DateTime), CAST(N'2021-03-30T10:20:11.000' AS DateTime), 1, 2, 2)
INSERT [dbo].[Watches] ([WatchId], [WatchName], [ImageUrl], [SmallImage], [Description], [Evaluate], [Price], [PricePromotion], [Quantity], [CreatedDate], [ModifiedDate], [IsActive], [CategoryId], [PublisherId]) VALUES (11, N'ĐỒNG HỒ CALVIN KLEIN STATELY K3G23626', N'SP00011.jpg', N'SP00011', N'Đồng hồ nữ, Dây da, Vỏ Thép không gỉ 316L/Mạ PVD, Kính sapphire, Bảo hành toàn quốc 1 năm', N'Đồng hồ cao cấp, xứng đáng với giá tiền', CAST(6050000.00 AS Decimal(18, 2)), CAST(6050000.00 AS Decimal(18, 2)), 98, CAST(N'2021-03-30T10:20:11.000' AS DateTime), CAST(N'2021-03-30T10:20:11.000' AS DateTime), 0, 2, 2)
INSERT [dbo].[Watches] ([WatchId], [WatchName], [ImageUrl], [SmallImage], [Description], [Evaluate], [Price], [PricePromotion], [Quantity], [CreatedDate], [ModifiedDate], [IsActive], [CategoryId], [PublisherId]) VALUES (12, N'ĐỒNG HỒ CALVIN KLEIN K5S341C6', N'SP00012.jpg', N'SP00012', N'Đồng hồ nam, Dây da, Vỏ Thép không gỉ 316L/Mạ PVD, Kính sapphire, Bảo hành toàn quốc 1 năm', N'Đồng hồ cao cấp, xứng đáng với giá tiền', CAST(10930000.00 AS Decimal(18, 2)), CAST(10930000.00 AS Decimal(18, 2)), 99, CAST(N'2021-03-30T10:20:11.000' AS DateTime), CAST(N'2021-03-30T10:20:11.000' AS DateTime), 1, 1, 2)
SET IDENTITY_INSERT [dbo].[Watches] OFF
INSERT [dbo].[WatchPromotion] ([WatchId], [PromotionId]) VALUES (1, 1)
INSERT [dbo].[WatchPromotion] ([WatchId], [PromotionId]) VALUES (3, 1)
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Accounts_dbo.AccountRoles_AccountRoleId] FOREIGN KEY([AccountRoleId])
REFERENCES [dbo].[AccountRoles] ([AccountRoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_dbo.Accounts_dbo.AccountRoles_AccountRoleId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Watches_WatchId] FOREIGN KEY([WatchId])
REFERENCES [dbo].[Watches] ([WatchId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Watches_WatchId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Orders_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_dbo.Orders_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Accounts_AccountId]
GO
ALTER TABLE [dbo].[Watches]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Watches_dbo.Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Watches] CHECK CONSTRAINT [FK_dbo.Watches_dbo.Categories_CategoryId]
GO
ALTER TABLE [dbo].[Watches]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Watches_dbo.Publishers_PublisherId] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publishers] ([PublisherId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Watches] CHECK CONSTRAINT [FK_dbo.Watches_dbo.Publishers_PublisherId]
GO
ALTER TABLE [dbo].[WatchPromotion]  WITH CHECK ADD  CONSTRAINT [FK_dbo.WatchPromotion_dbo.Promotions_PromotionId] FOREIGN KEY([PromotionId])
REFERENCES [dbo].[Promotions] ([PromotionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WatchPromotion] CHECK CONSTRAINT [FK_dbo.WatchPromotion_dbo.Promotions_PromotionId]
GO
ALTER TABLE [dbo].[WatchPromotion]  WITH CHECK ADD  CONSTRAINT [FK_dbo.WatchPromotion_dbo.Watches_WatchId] FOREIGN KEY([WatchId])
REFERENCES [dbo].[Watches] ([WatchId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WatchPromotion] CHECK CONSTRAINT [FK_dbo.WatchPromotion_dbo.Watches_WatchId]
GO
