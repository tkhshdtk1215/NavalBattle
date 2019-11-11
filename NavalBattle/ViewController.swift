





import UIKit

enum mode {
    case attack
    case move
}

class ViewController: UIViewController {
    
    @IBOutlet var playerLabel: UILabel!
    @IBOutlet var hanteiLabel: UILabel!
    
    @IBOutlet var SStaLabel: UILabel!
    @IBOutlet var CStaLabel: UILabel!
    @IBOutlet var WStaLabel: UILabel!
    
    @IBOutlet var attackLabel: UIButton!
    @IBOutlet var moveLabel: UIButton!
    @IBOutlet var dicisionLable: UIButton!
    @IBOutlet var endLabel: UIButton!
    
    @IBOutlet var SLabel: UIButton!
    @IBOutlet var CLabel: UIButton!
    @IBOutlet var WLabel: UIButton!
    
    var step = 1
    
    var player = 1
    
    var sta1 = [0,0,0,0,0,
                0,0,0,0,0,
                0,0,0,0,0,
                0,0,0,0,0,
                0,0,0,0,0]
    
    var sta2 = [0,0,0,0,0,
                0,0,0,0,0,
                0,0,0,0,0,
                0,0,0,0,0,
                0,0,0,0,0]
    
    var S1sta = 1
    var C1sta = 2
    var W1sta = 3
    
    var S2sta = 1
    var C2sta = 2
    var W2sta = 3

    var S1posi: Int!
    var C1posi: Int!
    var W1posi: Int!
    
    var S2posi: Int!
    var C2posi: Int!
    var W2posi: Int!
    
    var S1Sender: AnyObject!
    var C1Sender: AnyObject!
    var W1Sender: AnyObject!
    
    var S2Sender: AnyObject!
    var C2Sender: AnyObject!
    var W2Sender: AnyObject!
    
    var modePosi: Int!
    
    var ModeSender: AnyObject!
    
    var select: Int!
    var mode: mode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        attackLabel.isHidden = true
        moveLabel.isHidden = true
        dicisionLable.isHidden = true
    }
    
    func guardShip1(){
        if S1sta == 0 {
            if S1Sender != nil {
                S1Sender.setTitle("", for: .normal)
            }
            if S1posi != nil {
                sta1[S1posi] = 0
            }
            SLabel.isEnabled = false
            S1Sender = nil
            S1posi = nil
        }
        if C1sta == 0 {
            if C1Sender != nil {
                C1Sender.setTitle("", for: .normal)
            }
            if C1posi != nil {
                sta1[C1posi] = 0
            }
            CLabel.isEnabled = false
            C1Sender = nil
            C1posi = nil
        }
        if W1sta == 0 {
            if W1Sender != nil {
                W1Sender.setTitle("", for: .normal)
            }
            if W1posi != nil {
                sta1[W1posi] = 0
            }
            WLabel.isEnabled = false
            W1Sender = nil
            W1posi = nil
        }
    }
    
    func guardShip2(){
        if S2sta == 0 {
            if S2Sender != nil {
                S2Sender.setTitle("", for: .normal)
            }
            if S2posi != nil {
                sta2[S2posi] = 0
            }
            SLabel.isEnabled = false
            S2Sender = nil
            S2posi = nil
        }
        if C2sta == 0 {
            if C2Sender != nil {
                C2Sender.setTitle("", for: .normal)
            }
            if C2posi != nil {
                sta2[C2posi] = 0
            }
            CLabel.isEnabled = false
            C2Sender = nil
            C2posi = nil
        }
        if W2sta == 0 {
            if W2Sender != nil {
                W2Sender.setTitle("", for: .normal)
            }
            if W2posi != nil {
                sta2[W2posi] = 0
            }
            WLabel.isEnabled = false
            W2Sender = nil
            W2posi = nil
        }
    }

    func setEnd(){
        if step == 1 {
            S1Sender.setTitle("", for: .normal)
            C1Sender.setTitle("", for: .normal)
            W1Sender.setTitle("", for: .normal)
            playerLabel.text = "Player2"
        } else if step == 2 {
            if player == 1 {
                if ModeSender != nil {
                    ModeSender.setTitle("", for: .normal)
                    ModeSender = nil
                    modePosi = nil
                }
                playerLabel.text = "Player1"
                SStaLabel.text = String(S1sta)
                CStaLabel.text = String(C1sta)
                WStaLabel.text = String(W1sta)
                if S2Sender != nil {
                    S2Sender.setTitle("", for: .normal)
                }
                if C2Sender != nil {
                    C2Sender.setTitle("", for: .normal)
                }
                if W2Sender != nil {
                    W2Sender.setTitle("", for: .normal)
                }
                if S1Sender != nil {
                    S1Sender.setTitle("S", for: .normal)
                }
                if C1Sender != nil {
                    C1Sender.setTitle("C", for: .normal)
                }
                if W1Sender != nil {
                    W1Sender.setTitle("W", for: .normal)
                }
                guardShip1()
            } else if player == 2 {
                if ModeSender != nil {
                    ModeSender.setTitle("", for: .normal)
                    ModeSender = nil
                    modePosi = nil
                }
                playerLabel.text = "Player2"
                SStaLabel.text = String(S2sta)
                CStaLabel.text = String(C2sta)
                WStaLabel.text = String(W2sta)
                if S1Sender != nil {
                    S1Sender.setTitle("", for: .normal)
                }
                if C1Sender != nil {
                    C1Sender.setTitle("", for: .normal)
                }
                if W1Sender != nil {
                    W1Sender.setTitle("", for: .normal)
                }
                if S2Sender != nil {
                    S2Sender.setTitle("S", for: .normal)
                }
                if C2Sender != nil {
                    C2Sender.setTitle("C", for: .normal)
                }
                if W2Sender != nil {
                    W2Sender.setTitle("W", for: .normal)
                }
                guardShip2()
            }
            endLabel.isEnabled = false
        } else if step == 3 {
            self.navigationController?.popViewController(animated: false)
        }
        select = nil
        mode = nil
        hanteiLabel.text = "判定"
        attackLabel.setTitleColor(.systemBlue, for: .normal)
        moveLabel.setTitleColor(.systemBlue, for: .normal)
        SLabel.setTitleColor(.systemBlue, for: .normal)
        CLabel.setTitleColor(.systemBlue, for: .normal)
        WLabel.setTitleColor(.systemBlue, for: .normal)
        attackLabel.isEnabled = true
        moveLabel.isEnabled = true
        dicisionLable.isEnabled = true
        SLabel.isEnabled = true
        CLabel.isEnabled = true
        WLabel.isEnabled = true
    }
    
    @IBAction func endBtn(_ sender: Any) {
        if step == 1 {
            if player == 1 && S1posi != nil && C1posi != nil && W1posi != nil {
                player = 2
                performSegue(withIdentifier: "nextSegue", sender: nil)
            } else if player == 2 && S2posi != nil && C2posi != nil && W2posi != nil {
                attackLabel.isHidden = false
                moveLabel.isHidden = false
                dicisionLable.isHidden = false
                step = 2
                player = 1
                performSegue(withIdentifier: "nextSegue", sender: nil)
            }
        } else if step == 2 {
            if player == 1{
                player = 2
                performSegue(withIdentifier: "nextSegue", sender: nil)
            } else if player == 2{
                attackLabel.isHidden = false
                moveLabel.isHidden = false
                dicisionLable.isHidden = false
                player = 1
                performSegue(withIdentifier: "nextSegue", sender: nil)
            }
        }
        setEnd()
    }
    
    @IBAction func sensuikanBtn(_ sender: Any) {
        if player == 1 {
            if S1sta == 0 {
                return
            }
        } else if player == 2 {
            if S2sta == 0 {
                return
            }
        }
        SLabel.setTitleColor(.systemRed, for: .normal)
        CLabel.setTitleColor(.systemBlue, for: .normal)
        WLabel.setTitleColor(.systemBlue, for: .normal)
        if mode == .move {
            if ModeSender != nil {
                ModeSender.setTitle("", for: .normal)
                modePosi = nil
                ModeSender = nil
            }
        }
        self.select = 1
    }
    @IBAction func junyoukanBtn(_ sender: Any) {
        if player == 1 {
            if C1sta == 0 {
                return
            }
        } else if player == 2 {
            if C2sta == 0 {
                return
            }
        }
        SLabel.setTitleColor(.systemBlue, for: .normal)
        CLabel.setTitleColor(.systemRed, for: .normal)
        WLabel.setTitleColor(.systemBlue, for: .normal)
        if mode == .move {
            if ModeSender != nil {
                ModeSender.setTitle("", for: .normal)
                modePosi = nil
                ModeSender = nil
            }
        }
        self.select = 2
    }
    @IBAction func senkanBtn(_ sender: Any) {
        if player == 1 {
            if W1sta == 0 {
                return
            }
        } else if player == 2 {
            if W2sta == 0 {
                return
            }
        }
        SLabel.setTitleColor(.systemBlue, for: .normal)
        CLabel.setTitleColor(.systemBlue, for: .normal)
        WLabel.setTitleColor(.systemRed, for: .normal)
        if mode == .move {
            if ModeSender != nil {
                ModeSender.setTitle("", for: .normal)
                modePosi = nil
                ModeSender = nil
            }
        }
        self.select = 3
    }
    @IBAction func attackBtn(_ sender: Any) {
        self.mode = .attack
        attackLabel.setTitleColor(.systemRed, for: .normal)
        moveLabel.setTitleColor(.systemBlue, for: .normal)
    }
    @IBAction func moveBtn(_ sender: Any) {
        self.mode = .move
        attackLabel.setTitleColor(.systemBlue, for: .normal)
        moveLabel.setTitleColor(.systemRed, for: .normal)
    }
    
    
    
    @IBAction func dicisionBtn(_ sender: Any) {
        if modePosi != nil {
            attackLabel.isEnabled = false
            moveLabel.isEnabled = false
            dicisionLable.isEnabled = false
            SLabel.isEnabled = false
            CLabel.isEnabled = false
            WLabel.isEnabled = false
            endLabel.isEnabled = true
        }
        if mode == .attack {
            if player == 1 {
                mizushibuki(sta2)
                switch modePosi {
                case S2posi:
                    S2sta -= 1
                    hanteiLabel.text = "命中"
                    break
                case C2posi:
                    C2sta -= 1
                    hanteiLabel.text = "命中"
                    break
                case W2posi:
                    W2sta -= 1
                    hanteiLabel.text = "命中"
                    break
                default: break
                }
            } else if player == 2 {
                mizushibuki(sta1)
                switch modePosi {
                case S1posi:
                    S1sta -= 1
                    hanteiLabel.text = "命中"
                    break
                case C1posi:
                    C1sta -= 1
                    hanteiLabel.text = "命中"
                    break
                case W1posi:
                    W1sta -= 1
                    hanteiLabel.text = "命中"
                    break
                default: break
                }
            }
        } else if mode == .move {
            if player == 1 {
                switch select {
                case 1:
                    moveDicision(&sta1, &S1posi, &S1Sender, "S",S1sta)
                    break
                case 2:
                    moveDicision(&sta1, &C1posi, &C1Sender, "C",C1sta)
                    break
                case 3:
                    moveDicision(&sta1, &W1posi, &W1Sender, "W",W1sta)
                    break
                default:
                    break
                }
            } else if player == 2 {
                switch select {
                case 1:
                    moveDicision(&sta2, &S2posi, &S2Sender, "S",S2sta)
                    break
                case 2:
                    moveDicision(&sta2, &C2posi, &C2Sender, "C",C2sta)
                    break
                case 3:
                    moveDicision(&sta2, &W2posi, &W2Sender, "W",W2sta)
                    break
                default:
                    break
                }
            }
        }
        if S1sta == 0 && C1sta == 0 && W1sta == 0 {
            hanteiLabel.text = "勝利"
            step = 3
            return
        } else if S2sta == 0 && C2sta == 0 && W2sta == 0 {
            hanteiLabel.text = "勝利"
            step = 3
            return
        }
    }
    
    
    func mizushibuki(_ sta: [Int]) {
        switch modePosi {
        case 0:
            if sta[modePosi+1] != 0 || sta[modePosi+5] != 0 || sta[modePosi+6] != 0 {
                hanteiLabel.text = "水しぶき"
            } else {
                hanteiLabel.text = "はずれ"
            }
            break
        case 4:
            if sta[modePosi-1] != 0 || sta[modePosi+4] != 0 || sta[modePosi+5] != 0 {
                hanteiLabel.text = "水しぶき"
            } else {
                hanteiLabel.text = "はずれ"
            }
            break
        case 20:
            if sta[modePosi-5] != 0 || sta[modePosi-4] != 0 || sta[modePosi+1] != 0 {
                hanteiLabel.text = "水しぶき"
            } else {
                hanteiLabel.text = "はずれ"
            }
            break
        case 24 :
            if sta[modePosi-6] != 0 || sta[modePosi-5] != 0 || sta[modePosi-1] != 0 {
                hanteiLabel.text = "水しぶき"
            } else {
                hanteiLabel.text = "はずれ"
            }
            break
        case 1,2,3:
            if sta[modePosi-1] != 0 || sta[modePosi+1] != 0 || sta[modePosi+4] != 0 || sta[modePosi+5] != 0 || sta[modePosi+6] != 0 {
                hanteiLabel.text = "水しぶき"
            } else {
                hanteiLabel.text = "はずれ"
            }
            break
        case 5,10,15:
            if sta[modePosi-5] != 0 || sta[modePosi-4] != 0 || sta[modePosi+1] != 0 || sta[modePosi+5] != 0 || sta[modePosi+6] != 0 {
                hanteiLabel.text = "水しぶき"
            } else {
                hanteiLabel.text = "はずれ"
            }
            break
        case 9,14,19:
            if sta[modePosi-6] != 0 || sta[modePosi-5] != 0 || sta[modePosi-1] != 0 || sta[modePosi+4] != 0 || sta[modePosi+5] != 0 {
                hanteiLabel.text = "水しぶき"
            } else {
                hanteiLabel.text = "はずれ"
            }
            break
        case 21,22,23:
            if sta[modePosi-6] != 0 || sta[modePosi-5] != 0 || sta[modePosi-4] != 0 || sta[modePosi-1] != 0 || sta[modePosi+1] != 0 {
                hanteiLabel.text = "水しぶき"
            } else {
                hanteiLabel.text = "はずれ"
            }
            break
        default:
            if sta[modePosi-6] != 0 || sta[modePosi-5] != 0 || sta[modePosi-4] != 0 || sta[modePosi-1] != 0 || sta[modePosi+1] != 0 || sta[modePosi+4] != 0 || sta[modePosi+5] != 0 || sta[modePosi+6] != 0 {
                hanteiLabel.text = "水しぶき"
            } else {
                hanteiLabel.text = "はずれ"
            }
            break
        }
    }
    
    func moveDicision(_ sta: inout [Int], _ posi: inout Int, _ Sender: inout AnyObject, _ name: String, _ stamina: Int){
        sta[posi] = 0
        Sender.setTitle("", for: .normal)
        posi = modePosi
        sta[posi] = stamina
        Sender = ModeSender
        Sender.setTitle(name, for: .normal)
    }
    
    @IBAction func actionBtn(_ sender: AnyObject) {
        if step == 1 {
            if player == 1 {
                setShip(sender)
            } else {
                setShip(sender)
            }
        } else if step == 2 {
            if mode == .attack {
                if player == 1 {
                    setAttackPosi(sender,sta1)
                } else if player == 2 {
                    setAttackPosi(sender,sta2)
                }
            } else if mode == .move {
                setMovePosi(sender)
            }
        }
    }

    func setShip(_ sender: AnyObject){
        if player == 1 {
            guard sta1[sender.tag] == 0 else {
                return
            }
            switch select {
            case 1:
                if let Sender = self.S1Sender{
                    sta1[S1posi] = 0
                    Sender.setTitle("", for: .normal)
                }
                self.S1posi = sender.tag
                sta1[S1posi] = 1
                sender.setTitle("S", for: .normal)
                self.S1Sender = sender
                break
                
            case 2:
                if let Sender = self.C1Sender{
                    sta1[C1posi] = 0
                    Sender.setTitle("", for: .normal)
                }
                self.C1posi = sender.tag
                sta1[C1posi] = 2
                sender.setTitle("C", for: .normal)
                self.C1Sender = sender
                break
                
            case 3:
                if let Sender = self.W1Sender{
                    sta1[W1posi] = 0
                    Sender.setTitle("", for: .normal)
                }
                self.W1posi = sender.tag
                sta1[W1posi] = 3
                sender.setTitle("W", for: .normal)
                self.W1Sender = sender
                break
                
            default:
                break
            }
        } else if player == 2 {
            guard sta2[sender.tag] == 0 else {
                return
            }
            switch select {
            case 1:
                if let Sender = self.S2Sender{
                    sta2[S2posi] = 0
                    Sender.setTitle("", for: .normal)
                }
                self.S2posi = sender.tag
                sta2[S2posi] = 1
                sender.setTitle("S", for: .normal)
                self.S2Sender = sender
                break
                
            case 2:
                if let Sender = self.C2Sender{
                    sta2[C2posi] = 0
                    Sender.setTitle("", for: .normal)
                }
                self.C2posi = sender.tag
                sta2[C2posi] = 2
                sender.setTitle("C", for: .normal)
                self.C2Sender = sender
                break
                
            case 3:
                if let Sender = self.W2Sender{
                    sta2[W2posi] = 0
                    Sender.setTitle("", for: .normal)
                }
                self.W2posi = sender.tag
                sta2[W2posi] = 3
                sender.setTitle("W", for: .normal)
                self.W2Sender = sender
                break
                
            default:
                break
            }
        }
            
    }
    
    func setAttack(_ sender: AnyObject) {
        if let preSender = self.ModeSender{
            preSender.setTitle("", for: .normal)
        }
        sender.setTitle("A", for: .normal)
        self.ModeSender = sender
        self.modePosi = sender.tag
        if mode == .attack {
            attackLabel.setTitleColor(.systemRed, for: .normal)
            moveLabel.setTitleColor(.systemBlue, for: .normal)
        } else if mode == .move{
            attackLabel.setTitleColor(.systemBlue, for: .normal)
            moveLabel.setTitleColor(.systemRed, for: .normal)
        }
    }
    
    func setAttackPosi(_ sender: AnyObject, _ sta: [Int]) {
        guard sta[sender.tag] == 0 else {
            return
        }
        guard dicisionLable.isEnabled != false else {
            return
        }
        switch sender.tag {
        case 0:
            if sta[sender.tag+1] != 0 || sta[sender.tag+5] != 0 || sta[sender.tag+6] != 0 {
                setAttack(sender)
            }
            break
        case 4:
            if sta[sender.tag-1] != 0 || sta[sender.tag+4] != 0 || sta[sender.tag+5] != 0 {
                setAttack(sender)
            }
            break
        case 20:
            if sta[sender.tag-5] != 0 || sta[sender.tag-4] != 0 || sta[sender.tag+1] != 0 {
                setAttack(sender)
            }
            break
        case 24 :
            if sta[sender.tag-6] != 0 || sta[sender.tag-5] != 0 || sta[sender.tag-1] != 0 {
                setAttack(sender)
            }
            break
        case 1,2,3:
            if sta[sender.tag-1] != 0 || sta[sender.tag+1] != 0 || sta[sender.tag+4] != 0 || sta[sender.tag+5] != 0 || sta[sender.tag+6] != 0 {
                setAttack(sender)
            }
            break
        case 5,10,15:
            if sta[sender.tag-5] != 0 || sta[sender.tag-4] != 0 || sta[sender.tag+1] != 0 || sta[sender.tag+5] != 0 || sta[sender.tag+6] != 0 {
                setAttack(sender)
            }
            break
        case 9,14,19:
            if sta[sender.tag-6] != 0 || sta[sender.tag-5] != 0 || sta[sender.tag-1] != 0 || sta[sender.tag+4] != 0 || sta[sender.tag+5] != 0 {
                setAttack(sender)
            }
            break
        case 21,22,23:
            if sta[sender.tag-6] != 0 || sta[sender.tag-5] != 0 || sta[sender.tag-4] != 0 || sta[sender.tag-1] != 0 || sta[sender.tag+1] != 0 {
                setAttack(sender)
            }
            break
        default:
            if sta[sender.tag-6] != 0 || sta[sender.tag-5] != 0 || sta[sender.tag-4] != 0 || sta[sender.tag-1] != 0 || sta[sender.tag+1] != 0 || sta[sender.tag+4] != 0 || sta[sender.tag+5] != 0 || sta[sender.tag+6] != 0 {
                setAttack(sender)
            }
            break
        }
    }
    
    func setMove(_ sender: AnyObject) {
        if let ModeSender = self.ModeSender{
            ModeSender.setTitle("", for: .normal)
        }
        sender.setTitle("M", for: .normal)
        self.ModeSender = sender
        self.modePosi = sender.tag
    }
    
    func setMoveCase(_ sender: AnyObject, _ posi: Int) {
        switch posi % 5{
        case 0 :
            if sender.tag % 5 == 0 || (posi <= sender.tag && sender.tag <= posi + 4) {
                setMove(sender)
            }
            break
        case 1 :
            if sender.tag % 5 == 1 || (posi - 1 <= sender.tag && sender.tag <= posi + 3) {
                setMove(sender)
            }
            break
        case 2 :
            if sender.tag % 5 == 2 || (posi - 2 <= sender.tag && sender.tag <= posi + 2) {
                setMove(sender)
            }
            break
        case 3 :
            if sender.tag % 5 == 3 || (posi - 3 <= sender.tag && sender.tag <= posi + 1) {
                setMove(sender)
            }
            break
        case 4 :
            if sender.tag % 5 == 4 || (posi - 4 <= sender.tag && sender.tag <= posi) {
                setMove(sender)
            }
            break
        default:
            break
        }
    }
    
    func setMovePosi(_ sender: AnyObject) {
        guard dicisionLable.isEnabled != false else {
            return
        }
        if player == 1 {
            guard sta1[sender.tag] == 0 else {
                return
            }
            switch select {
            case 1:
                setMoveCase(sender,S1posi)
                break
            case 2:
                setMoveCase(sender,C1posi)
                break
            case 3:
                setMoveCase(sender,W1posi)
                break
            default:
                break
            }
        } else if player == 2 {
            guard sta2[sender.tag] == 0 else {
                return
            }
            switch select {
            case 1:
                setMoveCase(sender,S2posi)
                break
            case 2:
                setMoveCase(sender,C2posi)
                break
            case 3:
                setMoveCase(sender,W2posi)
                break
            default:
                break
            }
        }
    }
    
}

