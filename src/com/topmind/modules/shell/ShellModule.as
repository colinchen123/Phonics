package com.topmind.modules.shell
{
import assets.shell.ShellAsset;

import com.topmind.TestMadComponent;
import com.topmind.core.BaseModule;
import com.topmind.modules.shell.views.AvatarView;
import com.topmind.modules.shell.views.GameOptionView;
import com.topmind.modules.shell.views.ShellEvent;

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
    
    private var currentGame:BaseModule;
    
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
        addChild(new TestMadComponent());
        asset.btnAvatar.visible = false;
        asset.btnAvatar.addEventListener(MouseEvent.CLICK, btnAvatar_clickHandler);
    }
    
    public function showGame(game:BaseModule):void{
        gameOption.visible = false;
        currentGame = game;
        addChildAt(game, 0);
        asset.bg.visible = false;
        asset.btnAvatar.visible = false;
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
        gameOption.visible = true;
        removeChild(currentGame);
        currentGame.dispose();
        currentGame = null;
        asset.bg.visible = true;
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