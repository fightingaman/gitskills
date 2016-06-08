/**
 * Created by a on 2015/10/22.
 */
function checkPass(s){               //密码验证算法

    if(s.length < 8){

        return 0;
    }
    var ls = 0;

    if(s.match(/([a-z])+/)){

        ls++;

    }

    if(s.match(/([0-9])+/)){

        ls++;
    }

    if(s.match(/([A-Z])+/)){

        ls++;

    }
    if(s.match(/[^a-zA-Z0-9]+/)){

        ls++;

    }
    return ls

}