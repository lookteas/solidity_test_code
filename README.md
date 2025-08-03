

---

## 📅 第1周：Solidity 基础与开发环境搭建  

**目标**：能独立编写、编译、部署一个带状态读写的智能合约，并理解开发流程。

| 天        | 学习内容           | 学习任务（8小时）                                            | 如何验证掌握？✅                                              |
| --------- | ------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Day 1** | Solidity基础语法   | 1. 学变量类型（uint, bool, string, address）<br>2. 学函数定义（view, pure, payable）<br>3. 写一个`SimpleStorage.sol`：含`set(uint)`和`get()`函数<br>4. 在Remix中部署并调用 | ✅ 能在Remix中成功部署，调用`set(100)`后`get()`返回100        |
| **Day 2** | 状态变量与数据结构 | 1. 学`mapping`, `array`, `struct`<br>2. 写一个`UserRegistry.sol`：用mapping存储用户信息（name, age）<br>3. 实现`addUser()`和`getUser()` | ✅ 调用`addUser("Alice", 25)`后，`getUser(msg.sender)`返回正确数据 |
| **Day 3** | 函数修饰符与事件   | 1. 学`modifier`（如onlyOwner）<br>2. 学`event`定义与emit<br>3. 修改`SimpleStorage`：加`onlyOwner`修饰符，emit `ValueChanged(old, new)`事件 | ✅ 非owner调用set失败；事件在Remix日志中可见                  |
| **Day 4** | 安装开发环境       | 1. 安装Node.js、npm<br>2. 创建Hardhat项目：`npx hardhat`<br>3. 配置`hardhat.config.js`<br>4. 写脚本部署`SimpleStorage` | ✅ 运行`npx hardhat run scripts/deploy.js`成功部署并打印合约地址 |
| **Day 5** | Hardhat测试基础    | 1. 学`ethers.js`和`chai`<br>2. 写测试脚本：`test/SimpleStorage.test.js`<br>3. 测试set/get、事件触发 | ✅ `npx hardhat test`通过所有测试（3个以上）                  |
| **Day 6** | Gas与交易机制      | 1. 学Gas、Gas Price、Gas Limit概念<br>2. 用Hardhat查看部署和调用的Gas消耗<br>3. 修改合约减少Gas（如用`private`变量） | ✅ 在Hardhat控制台输出Gas报告，优化后Gas下降10%以上           |
| **Day 7** | 综合练习           | 1. 写一个`Counter.sol`：支持`increment()`, `decrement()`, `reset()`<br>2. 加`onlyOwner`<br>3. emit事件<br>4. 写部署脚本和测试 | ✅ 部署成功，测试全部通过，事件正常触发                       |
| **Day 8** | 复习与查漏         | 1. 重写本周所有合约<br>2. 整理代码到GitHub<br>3. 写一篇博客：“我的第一个Solidity合约” | ✅ GitHub仓库包含完整代码+README，博客发布到Dev.to或掘金      |

---

## 📅 第2周：智能合约结构与以太坊交互  

**目标**：掌握合约继承、接口、错误处理，并能用前端调用合约。

| 天         | 学习内容          | 学习任务                                                     | 如何验证掌握？✅                                  |
| ---------- | ----------------- | ------------------------------------------------------------ | ------------------------------------------------ |
| **Day 9**  | 继承与抽象合约    | 1. 学`is`, `virtual`, `override`<br>2. 写`BaseContract`和`ChildContract`<br>3. 实现抽象函数 | ✅ `ChildContract`能正确覆盖并调用父类函数        |
| **Day 10** | 接口（interface） | 1. 学`interface`语法<br>2. 为ERC-20写接口`IERC20`<br>3. 在合约中调用外部代币（如USDT测试网） | ✅ 合约能成功调用`IERC20.balanceOf()`并返回数值   |
| **Day 11** | 错误处理          | 1. 学`require`, `revert`, `assert`<br>2. 在`SimpleWallet`中加余额检查<br>3. 自定义错误：`error InsufficientBalance();` | ✅ 调用提款时余额不足时交易回滚，错误信息正确     |
| **Day 12** | 构造函数与初始化  | 1. 学`constructor`<br>2. 写带初始化owner的合约<br>3. 用`immutable`变量优化Gas | ✅ 部署后owner正确设置，immutable变量部署后不可变 |
| **Day 13** | Ethers.js 基础    | 1. 学连接provider、signer<br>2. 写JS脚本：读取账户余额、合约状态 | ✅ 脚本能打印当前账户ETH余额和合约中存储的值      |
| **Day 14** | 前端连接MetaMask  | 1. 创建React项目<br>2. 用`window.ethereum`请求连接<br>3. 显示连接的账户地址 | ✅ 点按钮弹出MetaMask，连接后显示钱包地址         |
| **Day 15** | 前端调用合约      | 1. 将合约ABI和地址导入前端<br>2. 实现调用`get()`和`set()`<br>3. 显示加载状态 | ✅ 前端能读取值，点击按钮后成功调用set并更新UI    |
| **Day 16** | 综合项目          | 1. 完成“去中心化计数器”DApp<br>2. 支持连接钱包、读写合约、显示交易哈希 | ✅ DApp本地运行正常，GitHub上传完整项目           |

---

## 📅 第3周：代币开发（ERC-20, ERC-721）  

**目标**：能开发并部署符合标准的代币合约。

| 天         | 学习内容       | 学习任务                                                     | 如何验证掌握？✅                              |
| ---------- | -------------- | ------------------------------------------------------------ | -------------------------------------------- |
| **Day 17** | ERC-20标准     | 1. 阅读ERC-20接口<br>2. 使用OpenZeppelin的`ERC20`<br>3. 写`MyToken.sol`：带name/symbol | ✅ `npx hardhat compile`无错，继承正确        |
| **Day 18** | 代币功能扩展   | 1. 加`mint()`和`burn()`<br>2. 加`pause()`功能（用`Pausable`）<br>3. 写测试：mint后balance增加 | ✅ 测试通过，owner能暂停转账                  |
| **Day 19** | 部署到测试网   | 1. 获取Goerli ETH（faucet）<br>2. 配置Hardhat部署到Goerli<br>3. 部署`MyToken` | ✅ Etherscan上查看合约，Verify成功            |
| **Day 20** | ERC-721基础    | 1. 学NFT概念<br>2. 用`ERC721`写`MyNFT.sol`<br>3. 实现`safeMint(to)` | ✅ 调用后`balanceOf(to)`增加1                 |
| **Day 21** | NFT元数据      | 1. 学`tokenURI()`<br>2. 使用IPFS上传JSON元数据<br>3. 返回`ipfs://...`链接 | ✅ 在MetaMask或OpenSea测试版显示NFT图像和名称 |
| **Day 22** | 批量铸造与权限 | 1. 加`onlyOwner`到mint<br>2. 实现`airdrop(address[] calldata)` | ✅ 能向多个地址空投NFT                        |
| **Day 23** | 测试代币逻辑   | 1. 写完整测试：mint、transfer、pause、balance                | ✅ `npx hardhat test`全部通过，覆盖率>90%     |
| **Day 24** | 综合项目       | 1. 部署ERC-20和ERC-721到Goerli<br>2. 创建前端展示NFT并支持mint | ✅ 用户可在前端mint NFT并查看                 |

---

## 📅 第4周：DApp前端集成  

**目标**：构建完整DApp，前端与合约深度交互。

| 天         | 学习内容       | 学习任务                                                     | 如何验证掌握？✅                                  |
| ---------- | -------------- | ------------------------------------------------------------ | ------------------------------------------------ |
| **Day 25** | React状态管理  | 1. 学`useState`, `useEffect`<br>2. 创建DApp框架：连接按钮、账户显示 | ✅ 连接后显示账户和余额                           |
| **Day 26** | 读取合约状态   | 1. 用`useEffect`监听合约变化<br>2. 显示`totalVotes`, `proposals[]` | ✅ 页面加载后正确显示合约数据                     |
| **Day 27** | 写入交易处理   | 1. 处理交易pending、成功、失败<br>2. 显示Toast通知           | ✅ 用户点击投票后显示“交易发送中”，成功后刷新数据 |
| **Day 28** | 表单与输入验证 | 1. 创建“创建提案”表单<br>2. 验证输入非空、长度限制           | ✅ 提交空表单提示错误，合法输入可提交             |
| **Day 29** | 事件监听       | 1. 用`contract.on("ProposalCreated", ...)`<br>2. 实时更新提案列表 | ✅ 另一个账户创建提案后，页面自动刷新显示         |
| **Day 30** | 样式美化       | 1. 用Tailwind CSS或Material UI美化界面                       | ✅ DApp界面美观，响应式布局                       |
| **Day 31** | 环境变量与配置 | 1. 用`.env`管理合约地址、网络配置                            | ✅ 支持本地、Goerli等多环境切换                   |
| **Day 32** | 项目部署       | 1. 用`npm run build`<br>2. 部署到Vercel或Netlify             | ✅ 在线链接可访问，功能完整                       |

---

> ⏭️ **第5周到第8周的详细每日任务表**（含DeFi、安全、升级合约、综合项目等）。

---

## 🧠 掌握判断标准总结：

| 类型         | 验证方式                        |
| ------------ | ------------------------------- |
| **语法掌握** | 能独立写出无编译错误的合约      |
| **功能实现** | 测试通过，Remix/Hardhat可调用   |
| **部署成功** | 测试网有合约地址，Etherscan可查 |
| **前端交互** | 用户可操作，状态实时更新        |
| **安全合规** | 无已知漏洞，Slither扫描通过     |
| **项目完整** | GitHub有代码，可部署运行        |

---

## 📅 第5周：高级Solidity与Gas优化  

**目标**：掌握库、低级调用、Gas优化技巧和可升级合约模式。

| 天         | 学习内容                       | 学习任务（8小时）                                            | 如何验证掌握？✅                                    |
| ---------- | ------------------------------ | ------------------------------------------------------------ | -------------------------------------------------- |
| **Day 33** | Library 与 using for           | 1. 学`library`和`using for`<br>2. 写`StringUtil`库：`function toUpper(string memory)`<br>3. 在合约中调用 | ✅ 字符串“hello”转为“HELLO”并返回                   |
| **Day 34** | 低级调用（call, delegatecall） | 1. 学`address.call()`和`delegatecall`区别<br>2. 写两个合约：A通过`call`调用B的函数<br>3. 演示`delegatecall`共享storage | ✅ `delegatecall`能修改调用方的storage变量          |
| **Day 35** | Gas优化技巧                    | 1. 学packed storage（uint128 + uint128）<br>2. 用`unchecked`减少溢出检查<br>3. 优化`Counter`合约Gas | ✅ 优化后`increment()`Gas减少15%以上（Hardhat报告） |
| **Day 36** | 可升级合约概念                 | 1. 学代理模式（Proxy Pattern）<br>2. 理解逻辑合约 vs 存储合约<br>3. 阅读OpenZeppelin Upgrades文档 | ✅ 能口述“为什么代理合约可升级”                     |
| **Day 37** | 透明代理（Transparent Proxy）  | 1. 使用`@openzeppelin/contracts-upgradeable`<br>2. 写`V1`和`V2`版本的Counter合约<br>3. 部署代理指向V1 | ✅ 部署后可通过代理调用V1功能                       |
| **Day 38** | 升级合约                       | 1. 用`upgradeTo()`将代理指向V2<br>2. V2新增`reset()`函数<br>3. 验证状态保留 | ✅ 升级后原计数不变，新函数可用                     |
| **Day 39** | UUPS代理                       | 1. 学UUPS（逻辑合约自己升级）<br>2. 实现`UUPSUpgradeable`<br>3. 写测试：只有owner能升级 | ✅ 非owner尝试升级失败                              |
| **Day 40** | 综合项目                       | 1. 将第2周的`Staking`合约改为可升级<br>2. 部署到本地网络，测试升级流程<br>3. 写文档说明升级风险 | ✅ GitHub提交升级版Staking，测试通过                |

---

## 📅 第6周：智能合约安全与漏洞防范  

**目标**：识别并防御常见漏洞，具备安全开发意识。

| 天         | 学习内容                 | 学习任务                                                     | 如何验证掌握？✅                                |
| ---------- | ------------------------ | ------------------------------------------------------------ | ---------------------------------------------- |
| **Day 41** | 重入攻击（Reentrancy）   | 1. 学DAO攻击原理<br>2. 写有漏洞的`VulnerableBank`（先转账后更新余额）<br>3. 写攻击合约提取资金 | ✅ 攻击合约成功提走所有资金（验证漏洞存在）     |
| **Day 42** | 防御重入                 | 1. 使用`ReentrancyGuard`<br>2. 改写`Bank`为“检查-生效-交互”模式<br>3. 重跑攻击测试 | ✅ 攻击合约失败，资金安全                       |
| **Day 43** | 整数溢出与SafeMath       | 1. 演示`uint8 + 1`溢出<br>2. 使用`SafeMath`或Solidity 0.8+自动检查<br>3. 写测试触发溢出 | ✅ 溢出时交易回滚，SafeMath防止错误             |
| **Day 44** | 访问控制漏洞             | 1. 学`Ownable`, `Roles`<br>2. 写`AdminRole`合约，支持多管理员<br>3. 测试非admin调用敏感函数 | ✅ 非管理员调用失败                             |
| **Day 45** | 前端攻击（Frontrunning） | 1. 学MEV、抢先交易<br>2. 写拍卖合约，演示出价被抢先<br>3. 用commit-reveal模式防御 | ✅ commit阶段隐藏出价，reveal后才揭晓，防止被抢 |
| **Day 46** | 静态分析工具             | 1. 安装Slither：`pip install slither-analyzer`<br>2. 扫描自己写的合约<br>3. 修复Slither报告的漏洞 | ✅ Slither报告“0重入漏洞”，关键问题已修复       |
| **Day 47** | 安全测试框架             | 1. 学`hardhat-gas-reporter`<br>2. 用`Waffle`或`foundry`写模糊测试<br>3. 测试`transfer()`在极端值下行为 | ✅ 模糊测试运行1000次无崩溃                     |
| **Day 48** | 安全审计实战             | 1. 找一个开源合约（如Uniswap V1简化版）<br>2. 写审计报告：列出3个风险点+修复建议 | ✅ 提交GitHub Gist审计报告，逻辑清晰            |

---

## 📅 第7周：DeFi 基础与项目实战  

**目标**：开发一个带Chainlink集成的质押（Staking）DApp。

| 天         | 学习内容             | 学习任务                                                     | 如何验证掌握？✅                                     |
| ---------- | -------------------- | ------------------------------------------------------------ | --------------------------------------------------- |
| **Day 49** | DeFi 概念            | 1. 学Staking、Yield、APR<br>2. 画架构图：用户→Staking合约→奖励分发 | ✅ 能解释“为什么用户愿意质押”                        |
| **Day 50** | Staking 合约基础     | 1. 写`Staking.sol`：支持`stake(tokenAmount)`<br>2. 记录用户质押时间、数量 | ✅ 调用后`userInfo[msg.sender]`正确更新              |
| **Day 51** | 奖励计算             | 1. 实现`getReward()`：按时间计算奖励<br>2. 奖励代币用ERC-20（`RewardToken`） | ✅ 质押1小时后调用`getReward()`获得正确数量          |
| **Day 52** | Chainlink Price Feed | 1. 学`AggregatorV3Interface`<br>2. 在合约中获取ETH/USD价格   | ✅ 调用`getPrice()`返回类似`180000000000`（1800.00） |
| **Day 53** | 安全加固             | 1. 加`ReentrancyGuard`<br>2. 防止过早领取奖励<br>3. 测试极端情况（0质押、超长等待） | ✅ 所有测试通过，无漏洞                              |
| **Day 54** | Hardhat 部署脚本     | 1. 写`deploy_staking.js`：部署RewardToken + Staking<br>2. 设置owner、喂价器地址 | ✅ 一键部署所有合约，地址正确关联                    |
| **Day 55** | 前端开发（1）        | 1. 显示ETH价格、质押余额、预计奖励<br>2. 用Ethers.js读取合约状态 | ✅ 页面实时显示ETH价格（来自Chainlink）              |
| **Day 56** | 前端开发（2）        | 1. 实现质押和领取按钮<br>2. 显示交易状态和错误提示           | ✅ 用户可质押ERC-20，领取奖励，UI反馈清晰            |

---

## 📅 第8周：综合项目与部署上线  

**目标**：完成一个完整DApp并部署，形成作品集。

| 天         | 学习内容       | 学习任务                                                     | 如何验证掌握？✅                                |
| ---------- | -------------- | ------------------------------------------------------------ | ---------------------------------------------- |
| **Day 57** | 项目选型与设计 | 1. 选项目：NFT市场 或 去中心化投票<br>2. 画架构图、写需求文档<br>3. 定义合约、事件、前端模块 | ✅ 提交`PROJECT.md`：含功能列表、技术栈、流程图 |
| **Day 58** | 合约开发（1）  | 1. 写核心合约（如`NFTMarket.sol`）<br>2. 支持上架、取消、购买 | ✅ 能上架NFT，价格正确记录                      |
| **Day 59** | 合约开发（2）  | 1. 加手续费分配（如1%给平台）<br>2. 支持拍卖模式（可选）     | ✅ 购买后卖家收钱，平台收手续费                 |
| **Day 60** | 测试全覆盖     | 1. 写测试：上架、购买、取消、手续费<br>2. 覆盖率>90%         | ✅ `npx hardhat coverage`显示高覆盖率           |
| **Day 61** | 前端开发       | 1. 实现NFT列表、详情页、购买弹窗<br>2. 支持MetaMask签名购买  | ✅ 用户可浏览并购买NFT                          |
| **Day 62** | 部署到测试网   | 1. 部署合约到Goerli/Sepolia<br>2. Verify on Etherscan        | ✅ Etherscan显示已验证，交易可查                |
| **Day 63** | 前端部署       | 1. 构建前端：`npm run build`<br>2. 部署到Vercel/Netlify      | ✅ 在线链接可访问，功能完整                     |
| **Day 64** | 作品集准备     | 1. 写README：项目介绍、截图、链接<br>2. 录制3分钟演示视频<br>3. 发布到GitHub、LinkedIn、Dev.to | ✅ GitHub Star ≥1，收到社区反馈                 |

---

## 🎁 最终成果清单（8周后将拥有）：

✅ 8+ 个Solidity合约项目（含ERC-20、ERC-721、Staking、Proxy等）  
✅ 2+ 个完整DApp（前端+合约+测试）  
✅ 测试网部署经验（Goerli/Sepolia）  
✅ GitHub作品集（含README、截图、部署链接）  
✅ 安全开发意识与审计能力  
✅ 可用于求职或启动项目的实战能力

---

## 🔗 推荐工具与资源（持续使用）：

- **开发**：Hardhat, Remix, OpenZeppelin, Ethers.js
- **测试**：Chai, Waffle, Slither
- **部署**：Vercel, IPFS, Etherscan
- **学习**：[Solidity by Example](https://solidity-by-example.org/)、[Secureum Bootcamp](https://secureum.xyz/)、[Foundry Book](https://book.getfoundry.sh/)

---