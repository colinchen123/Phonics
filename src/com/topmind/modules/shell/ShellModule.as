package com.topmind.modules.shell
{
import assets.shell.ShellAsset;

import com.topmind.core.AppConfig;
import com.topmind.core.BaseModule;
import com.topmind.modules.map.MapModule;
import com.topmind.modules.shell.views.AvatarView;
import com.topmind.modules.shell.views.GameOptionView;
import com.topmind.modules.shell.views.ShellEvent;
import com.ysrlin.ui.components.Navigation;

import flash.events.MouseEvent;

import mx.core.UIComponent;

public class ShellModule extends UIComponent
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>ShellModule</code>实例.
     *
     */
    public function ShellModule()
    {
        super();
        new ShellModuleContext(this);
        initDisplay();
        width = 1024;
        height = 768;
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:ShellAsset;
    
    private var gameOption:GameOptionView;
    private var avatarView:AvatarView;
    private var navigator:Navigation;
    private var currentGame:BaseModule;
    
    private var map:MapModule;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    private function initDisplay():void{
        asset = new ShellAsset();
        avatarView = new AvatarView();
        avatarView.replace(asset.avatarOption);
        addChild(asset);
        gameOption = new GameOptionView();
        gameOption.replace(asset.games);
        gameOption.visible = false;
        asset.btnSet.addEventListener(MouseEvent.CLICK, btnSet_clickHandler);
        asset.btnAvatar.visible = false;
        asset.btnAvatar.addEventListener(MouseEvent.CLICK, btnAvatar_clickHandler);
        
        asset.games.visible = false;
        asset.bg.visible =false;
        
        navigator = new Navigation();
        navigator.setSize(1024, 768);
        addChildAt(navigator, 0);
        navigator.showScreen(map = new MapModule());
    }
    
    public function showGame(game:BaseModule):void{
        AppConfig.soundManager.stopSingleSound();
//        if (currentGame){
//            removeChild(currentGame);
//            currentGame.dispose();
//        }
//        gameOption.visible = false;
//        currentGame = game;
//        addChildAt(game, 0);
//        asset.bg.visible = false;
//        asset.btnAvatar.visible = false;
        navigator.showScreen(game);
        currentGame = game;
    }
    
    public function selectAvatar():void{
        avatarView.visible = true;
        gameOption.visible = false;
        asset.btnAvatar.visible = false;
    }
    
    public function selectGame():void{
        avatarView.hide();
        currentGame && exitCurrentGame();
        gameOption.visible = true;
        asset.btnAvatar.visible = true;
    }
    
    public function exitCurrentGame():void{
        if (currentGame == null) return;
//        gameOption.visible = true;
//        removeChild(currentGame);
//        currentGame.dispose();
//        currentGame = null;
        navigator.showScreen(map);
//        asset.bg.visible = true;
        asset.btnAvatar.visible = true;
    }
    
    public function dispose():void{
    }
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function btnAvatar_clickHandler(event:MouseEvent):void{
        selectAvatar();
    }
    
    private function btnSet_clickHandler(event:MouseEvent):void{
        dispatchEvent(new ShellEvent(ShellEvent.OPEN_SET));
    }
    
}
}